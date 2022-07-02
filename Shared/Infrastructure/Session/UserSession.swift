//
//  UserSession.swift
//  SDO
//
//  Created by Joel Kingsley on 26/06/2022.
//

import Foundation

enum UserSession {
    static func setUserSession() {
        
    }
    
    static func clearSession() {
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}

extension Key: CaseIterable {
    static var allCases: [Key] {
        return []
    }
}
