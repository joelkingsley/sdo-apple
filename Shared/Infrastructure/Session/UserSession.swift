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
        return [.userPrimaryKey, .userUuid, .userEmail, .accessToken, .appleRefreshToken]
    }

    static let userPrimaryKey: Key = "userPrimaryKey"
    static let userUuid: Key = "userUuid"
    static let userEmail: Key = "userEmail"
    static let accessToken: Key = "accessToken"
    static let appleRefreshToken: Key = "appleRefreshToken"
}

enum UserSession {
    @UserDefault(key: .userPrimaryKey)
    public static var userPrimaryKey: String?
    
    @UserDefault(key: .userUuid)
    public static var userUuid: String?
    
    @UserDefault(key: .userEmail)
    public static var userEmail: String?
    
    @UserDefault(key: .accessToken)
    public static var accessToken: String?
    
    @UserDefault(key: .appleRefreshToken)
    public static var appleRefreshToken: String?

    static func setUserData(userData: UserData) {
        userPrimaryKey = userData.id
        userUuid = userData.userUuid
        userEmail = userData.userEmail
    }
    
    static func setUserSession(user: SDOUser, forcingRefresh: Bool = false) async throws {
        let idToken = try await user.idTokenForcingRefresh(forcingRefresh)
        accessToken = idToken
    }

    static func setAppleTokens(refreshToken: String) {
        appleRefreshToken = refreshToken
    }
    
    static func clearSession() {
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}
