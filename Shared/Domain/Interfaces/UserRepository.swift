//
//  UserRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

/**
 Repository that performs operations related to users
 */
protocol UserRepository {
    /// Get the user data
    func getUserData(userUuid: String) async -> Result<UserData, BusinessError>
}
