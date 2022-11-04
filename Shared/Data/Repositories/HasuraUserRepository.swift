//
//  HasuraUserRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

/**
 Repository that performs operations related to users
 */
class HasuraUserRepository: UserRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    /// Get the user data
    func getUserData(userUuid: String) async -> Result<UserData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetUserDataQuery(userUuid: userUuid))
            return .success(try data.toEntity())
        } catch {
            AppLogger.error("Error in getUserData: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
