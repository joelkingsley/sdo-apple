//
//  AuthenticationViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import Foundation
import FirebaseAuth

/// A class conforming to `ObservableObject` used to represent a user's authentication status.
@MainActor
final class AuthenticationViewModel: ObservableObject {
    /// The user's log in status.
    /// - note: This will publish updates when its value changes.
    @Published var state: AuthState
    
    private var authService: SDOAuthService {
        return FirebaseAuthService()
    }

    /// Creates an instance of this view model.
    init() {
        self.state = .signedOut
    }
    
    func restorePreviousSignIn() {
        Task { [weak self] in
            let state = await authService.restorePreviousSignIn()
            self?.state = state
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user, forcingRefresh: true)
            }
        }
    }

    /// Signs the user in with Google
    func signInWithGoogle() {
        Task { [weak self] in
            let state = await authService.signInWithGoogle()
            self?.state = state
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)
            }
        }
    }

    /// Signs the user out.
    func signOut() {
        if authService.signOut() {
            self.state = .signedOut
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
}
