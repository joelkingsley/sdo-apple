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
        return [.accessToken]
    }

    static let accessToken: Key = "accessToken"
}

enum UserSession {
    @UserDefault(key: .accessToken)
    public static var accessToken: String?
    
    static func setUserSession(user: SDOUser, forcingRefresh: Bool = false) async throws {
        accessToken = try await user.idTokenForcingRefresh(forcingRefresh)
    }
    
    static func clearSession() {
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}
