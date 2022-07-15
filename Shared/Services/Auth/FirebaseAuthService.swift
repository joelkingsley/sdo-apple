//
//  FirebaseAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

class FirebaseAuthService: SDOAuthService {
    private var googleSignInAuthenticator: GoogleSignInAuthenticator {
      return GoogleSignInAuthenticator()
    }
    
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
            do {
                let authDataResult = try await Auth.auth().signIn(with: credential)
                let user = authDataResult.user
                return .signedIn(user)
            } catch {
                AppLogger.error("Unexpectedly got error while signing in with firebase: \(error)")
                return .signedOut
            }
        } catch {
            AppLogger.error("Unexpectedly got error while signing in with google: \(error)")
            return .signedOut
        }
    }
    
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
