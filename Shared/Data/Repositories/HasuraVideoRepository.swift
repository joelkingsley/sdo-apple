//
//  HasuraVideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

class HasuraVideoRepository: VideoRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    func getDataForHomeScreen(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetDataForHomeScreenQuery(uuid: userUuid)).toEntity()
            return .success(data)
        } catch {
            AppLogger.error("Error in getDataForHomeScreen: \(error)")
            return .failure(BusinessErrors.serverError())
        }
    }
}
