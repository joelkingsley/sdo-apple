//
//  HasuraChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Channels
 */
class HasuraChannelRepository: ChannelRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    /// Gets list of all the channels
    func getAllChannels() async -> Result<[GetAllChannelsQuery.Data.Channel], BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetAllChannelsQuery())
            return .success(data.channels)
        } catch {
            AppLogger.error("Error in getAllChannels: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
