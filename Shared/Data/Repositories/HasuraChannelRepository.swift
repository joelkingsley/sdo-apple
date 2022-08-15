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
    
    func getAllChannels() async -> Result<[ChannelData], BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(query: GetAllChannelsQuery())
            let channels = try data.channels.map { try $0.toEntity() }
            return .success(channels)
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
