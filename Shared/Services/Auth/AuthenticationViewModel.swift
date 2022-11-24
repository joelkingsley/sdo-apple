//
//  AuthenticationViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import Foundation
import FirebaseAuth
import Combine
import AuthenticationServices

/// A class conforming to `ObservableObject` used to represent a user's authentication status.
@MainActor
final class AuthenticationViewModel: ObservableObject {
    // MARK: - Use Cases and Services
    
    private let getAppleIdRefreshTokenUseCase = GetAppleIdRefreshTokenUseCase(
        tokenRepository: HasuraTokenRepository(
            graphQLService: HasuraGraphQLService()))
    
    private let authService: SDOAuthService = FirebaseAuthService.shared
    
    // MARK: - Properties
    
    /// The user's log in status.
    /// - note: This will publish updates when its value changes.
    @Published var state: AuthState
    
    var cancellables = Set<AnyCancellable>()

    /// Creates an instance of this view model.
    init() {
        self.state = .signedOut
    }
    
    // MARK: - Methods
    
    func restorePreviousSignIn() {
        Task { [weak self] in
            if state == .signedOut {
                let state = await authService.restorePreviousSignIn()
                if case let .signedIn(user) = state {
                    try? await UserSession.setUserSession(user: user, forcingRefresh: true)
                }
                self?.state = state
            }
        }
    }

    /// Signs the user in with Google
    func signInWithGoogle() {
        Task { [weak self] in
            let state = await authService.signInWithGoogle()
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)
            }
            self?.state = state
        }
    }
    /// Configures the Apple sign-in authorization request
    func configure(appleSignInAuthorizationRequest request: ASAuthorizationAppleIDRequest) {
        return authService.configure(appleSignInAuthorizationRequest: request)
    }
    
    /// Signs the user in with Apple
    func signInWithApple(requestAuthorizationResult result: Result<ASAuthorization, Error>) {
        Task { [weak self] in
            let (state, authorizationCode) = await authService.signInWithApple(requestAuthorizationResult: result)
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)
            }
            if let authorizationCode,
               let refreshToken = try? await getAppleIdRefreshTokenUseCase.execute(
                authorizationCode: authorizationCode).get().refreshToken
            {
                UserSession.setAppleTokens(refreshToken: refreshToken)
            }
            self?.state = state
        }
    }

    /// Signs the user out.
    func signOut() {
        Task {
            await MainActor.run {
                if authService.signOut() {
                    self.state = .signedOut
                }
            }
        }
    }
    
    /// Returns the profile image url string of the logged-in user
    func getUserProfileImage() -> URL? {
        guard case let .signedIn(user) = state else {
            return nil
        }
        return user.photoURL
    }
    
    /// Returns the user object if in `signedIn` state
    func getUser() -> SDOUser? {
        guard case let .signedIn(user) = state else {
            return nil
        }
        return user
    }
    
    /// Deletes the user from all auth providers
    func deleteUser() {
        AppLogger.debug(UserSession.appleRefreshToken ?? "N/A")
        Task { [weak self] in
            if await authService.deleteAccount() {
                AppLogger.debug("Successfully deleted user account")
                self?.state = .signedOut
            } else {
                AppLogger.error("Failed to delete user account")
            }
        }
    }
    
    /// Gets a list of all social accounts connected to the user
    func getConnectedSocialAccounts() -> [SDOUserInfo] {
        return authService.getConnectedSocialAccounts()
    }
}
