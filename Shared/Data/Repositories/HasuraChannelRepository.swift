//
//  HasuraChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

class HasuraChannelRepository: ChannelRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    func getAllChannels() async -> Result<[GetAllChannelsQuery.Data.Channel], BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetAllChannelsQuery())
            return .success(data.channels)
        } catch {
            AppLogger.error("Error in getAllChannels: \(error)")
            if error is BusinessErrors.parsingError {
                return .failure(error)
            } else {
                return .failure(BusinessErrors.serverError())
            }
        }
    }
}
