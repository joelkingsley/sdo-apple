//
//  SDOAuthService.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation

protocol SDOAuthService {
    func restorePreviousSignIn() async -> AuthState
    func signInWithGoogle() async -> AuthState
    func signOut() -> Bool
}
