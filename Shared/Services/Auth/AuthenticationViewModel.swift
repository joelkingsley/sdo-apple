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

    private let revokeAppleIdRefreshTokenUseCase = RevokeAppleIdRefreshTokenUseCase(
        tokenRepository: HasuraTokenRepository(
            graphQLService: HasuraGraphQLService()))

    private let getUserDataUseCase = GetUserDataUseCase(
        userRepository: HasuraUserRepository(
            graphQLService: HasuraGraphQLService()))

    private let deleteAllUserDataUseCase = DeleteAllUserDataUseCase(
        userRepository: HasuraUserRepository(
            graphQLService: HasuraGraphQLService()))

    private let authService: SDOAuthService = FirebaseAuthService.shared

    // MARK: - Properties

    /// The user's log in status.
    /// - note: This will publish updates when its value changes.
    @Published var state: AuthState

    var cancellables = Set<AnyCancellable>()

    /// Creates an instance of this view model.
    init() {
        self.state = .loading
    }

    // MARK: - Methods

    func restorePreviousSignIn() {
        Task { [weak self] in
            if state == .signedOut || state == .loading {
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
        state = .loading
        Task { [weak self] in
            let state = await authService.signInWithGoogle()
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)

                // Fetch and set user data in user session
                if let userData = try? await getUserDataUseCase.execute(userUuid: user.uid).get() {
                    UserSession.setUserData(userData: userData)
                }
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
        state = .loading
        Task { [weak self] in
            let (state, authorizationCode) = await authService.signInWithApple(requestAuthorizationResult: result)
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)

                // Fetch and set user data in user session
                if let userData = try? await getUserDataUseCase.execute(userUuid: user.uid).get() {
                    UserSession.setUserData(userData: userData)
                }
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
                    UserSession.clearSession()
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
    func deleteUser() async -> Bool {
        let identityProviders = getConnectedSocialAccounts()
        if await authService.deleteAccount() {
            AppLogger.debug("Successfully deleted user account from Firebase")
            
            // Delete user data from SDO database
            if case let .signedIn(user) = state,
               let userPrimaryKey = UserSession.userPrimaryKey
            {
                async let deleteAllUserDataRequest = deleteAllUserDataUseCase.execute(userPrimaryKey: userPrimaryKey)
                switch await deleteAllUserDataRequest {
                case let .success(response):
                    AppLogger.debug("Deleted user data for \(response.userUuid)")
                case let .failure(error):
                    AppLogger.error("Failed to delete user data: \(error.localizedDescription)")
                }
            }

            if let refreshToken = UserSession.appleRefreshToken,
               identityProviders.first(where: { $0.identityProvider == .apple}) != nil
            {
                // Revoke Apple ID refresh token
                async let revokeAppleIdRefreshTokenRequest = revokeAppleIdRefreshTokenUseCase.execute(refreshToken: refreshToken)
                switch await revokeAppleIdRefreshTokenRequest {
                case let .success(response):
                    AppLogger.debug("Revoked Apple ID refresh token: \(response.isRevoked)")
                case let .failure(error):
                    AppLogger.error("Failed to revoke Apple ID refresh token: \(error.localizedDescription)")
                }
            }

            return true
        } else {
            AppLogger.error("Failed to delete user account")
            return false
        }
    }
    
    /// Gets a list of all social accounts connected to the user
    func getConnectedSocialAccounts() -> [SDOUserInfo] {
        return authService.getConnectedSocialAccounts()
    }

    /// Gets the user data from the backend database
    private func getUserData(userUuid: String) async -> Result<UserData, BusinessError> {
        return await getUserDataUseCase.execute(userUuid: userUuid)
    }
}
