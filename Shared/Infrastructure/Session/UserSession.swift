//
//  UserSession.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation
import FirebaseAuth

extension Key: CaseIterable {
    static var allCases: [Key] {
        return [.accessToken, .appleRefreshToken]
    }

    static let accessToken: Key = "accessToken"
    static let appleRefreshToken: Key = "appleRefreshToken"
}

enum UserSession {
    @UserDefault(key: .accessToken)
    public static var accessToken: String?
    
    @UserDefault(key: .appleRefreshToken)
    public static var appleRefreshToken: String?
    
    static func setUserSession(user: SDOUser, forcingRefresh: Bool = false) async throws {
        accessToken = try await user.idTokenForcingRefresh(forcingRefresh)
    }
    
    static func setAppleTokens(refreshToken: String) {
        appleRefreshToken = refreshToken
    }
    
    static func clearSession() {
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}
