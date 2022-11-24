//
//  GetUserDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension GetUserDataQuery.Data {
    func toEntity() throws -> UserData {
        guard let usersByPk else {
            throw BusinessErrors.parsingError()
        }
        return UserData(
            userUuid: usersByPk.userUuid,
            userEmail: usersByPk.userEmail
        )
    }
}
