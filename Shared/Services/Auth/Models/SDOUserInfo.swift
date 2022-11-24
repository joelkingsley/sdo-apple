//
//  SDOUserInfo.swift
//  SDO
//
//  Created by Joel Kingsley on 25/11/2022.
//

import Foundation
import FirebaseAuth

/// Represents user data returned from an identity provider in the SDO app.
struct SDOUserInfo: Identifiable {
    var id: UUID {
        UUID(uuidString: providerId) ?? UUID()
    }
    
    let providerId: String
    
    var providerName: String {
        switch providerId {
        case GoogleAuthProviderID:
            return "Google"
        case "apple.com":
            return "Apple"
        default:
            return "Unknown"
        }
    }
    
    var providerImageSystemName: String {
        switch providerId {
        case GoogleAuthProviderID:
            return "g.circle.fill"
        case "apple.com":
            return "apple.logo"
        default:
            return "questionmark.circle"
        }
    }
}

extension UserInfo {
    func toEntity() -> SDOUserInfo {
        return SDOUserInfo(providerId: providerID)
    }
}
