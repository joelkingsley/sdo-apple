//
//  DeleteAllUserDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 28/11/2022.
//

import Foundation

extension DeleteAllUserDataMutation.Data {
    func toEntity() throws -> DeleteAllUserData {
        guard let deleteUsersByPk else {
            throw BusinessErrors.parsingError()
        }
        
        return DeleteAllUserData(
            userEmail: deleteUsersByPk.userEmail,
            userUuid: deleteUsersByPk.userUuid
        )
    }
}
