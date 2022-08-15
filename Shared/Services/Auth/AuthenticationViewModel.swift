//
//  AuthenticationViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 27/06/2022.
//

import Foundation
import FirebaseAuth

/// A class conforming to `ObservableObject` used to represent a user's authentication status.
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
        Task {
            let state = await authService.restorePreviousSignIn()
            await MainActor.run(body: { [weak self] in
                self?.state = state
            })
            if case let .signedIn(user) = state {
                try? await UserSession.setUserSession(user: user)
            }
        }
    }

    /// Signs the user in with Google
    func signInWithGoogle() {
        Task {
            let state = await authService.signInWithGoogle()
            await MainActor.run(body: { [weak self] in
                self?.state = state
            })
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
}
