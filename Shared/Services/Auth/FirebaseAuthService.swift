//
//  FirebaseAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
import CryptoKit

class FirebaseAuthService: SDOAuthService {
    public static let shared = FirebaseAuthService()
    
    private init() {}
    
    // MARK: - Properties
    
    // Unhashed nonce.
    private var currentNonce: String?
    
    private var googleSignInAuthenticator: GoogleSignInAuthenticator {
      return GoogleSignInAuthenticator()
    }
    
    // MARK: - Methods
    
    /// Restores current user session from keychain if valid
    func restorePreviousSignIn() async -> AuthState {
        return await withCheckedContinuation { continuation in
            if let currentUser = Auth.auth().currentUser {
                AppLogger.debug("Restoring previous sign in")
                continuation.resume(returning: .signedIn(currentUser))
            } else {
                AppLogger.debug("Could not restore previous sign in")
                continuation.resume(returning: .signedOut)
            }
        }
    }
    
    /// Signs in user with the Google sign-in (pop-up) and then signs in on Firebase
    func signInWithGoogle() async -> AuthState {
        do {
            let user: GIDGoogleUser = try await googleSignInAuthenticator.signIn()
            let authentication = user.authentication
            guard let idToken = authentication.idToken else {
                return .signedOut
            }
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: authentication.accessToken
            )
            return await signInOnFirebase(with: credential)
        } catch {
            AppLogger.error("Unexpectedly got error while signing in with Google: \(error)")
            return .signedOut
        }
    }
    
    /// Configures the Apple sign-in authorization request
    func configure(appleSignInAuthorizationRequest request: ASAuthorizationAppleIDRequest) {
        let nonce = randomNonceString()
        currentNonce = nonce
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
    }
    
    /// Uses authorization credentials for from Apple sign-in to sign in on Firebase
    func signInWithApple(requestAuthorizationResult result: Result<ASAuthorization, Error>) async -> AuthState {
        switch result {
        case let .success(authorization):
            switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                // Create an account in your system.
                let userIdentifier = appleIDCredential.user
                let fullName = String(describing: appleIDCredential.fullName)
                let email = String(describing: appleIDCredential.email)
                AppLogger.debug("Signed in with Apple: \(userIdentifier), \(fullName), \(email)")
                
                guard let nonce = currentNonce else {
                    AppLogger.error("Invalid state: A login callback was received, but no login request was sent.")
                    return .signedOut
                }
                
                guard let idToken = appleIDCredential.identityToken else {
                    AppLogger.error("Unable to fetch identity token")
                    return .signedOut
                }
                
                guard let idTokenString = String(data: idToken, encoding: .utf8) else {
                    AppLogger.error("Unable to serialize token string from data: \(idToken.debugDescription)")
                    return .signedOut
                }
                
                // Initialize a Firebase credential.
                let credential = OAuthProvider.credential(
                    withProviderID: "apple.com",
                    idToken: idTokenString,
                    rawNonce: nonce
                )
                return await signInOnFirebase(with: credential)
            default:
                AppLogger.error("Unexpected credential error while signing in with Apple")
                return .signedOut
            }
        case let .failure(error):
            AppLogger.error("Unexpectedly got error while signing in with Apple: \(error)")
            return .signedOut
        }
    }
    
    /// Signs in to firebase using the given auth credentials
    /// - note: To be invoked after authenticating with username-password or social sign-in
    private func signInOnFirebase(with credential: AuthCredential) async -> AuthState {
        do {
            let authDataResult = try await Auth.auth().signIn(with: credential)
            let user = authDataResult.user
            return .signedIn(user)
        } catch {
            AppLogger.error("Unexpectedly got error while signing in with firebase: \(error)")
            return .signedOut
        }
    }
    
    /// Signs in user out of all authenticators and firebase
    func signOut() -> Bool {
        do {
            googleSignInAuthenticator.signOut()
            try Auth.auth().signOut()
            return true
        } catch {
            AppLogger.error("Encountered error signing out: \(error).")
            return false
        }
    }
}

// MARK: - Crytographic algorithms

extension FirebaseAuthService {
    /// Generates a random nonce string
    /// - note: Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    /// Hash using SHA256
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}
