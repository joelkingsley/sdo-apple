//
//  SDOAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation

protocol SDOAuthService {
    /// Restores current user session from keychain if valid
    func restorePreviousSignIn() async -> AuthState

    /// Signs in user with the google sign-in (pop-up) and then signs in on firebase
    func signInWithGoogle() async -> AuthState

    /// Signs in to firebase using the given auth credentials
    /// - note: To be invoked after authenticating with username-password or social sign-in
    func signOut() -> Bool
}
