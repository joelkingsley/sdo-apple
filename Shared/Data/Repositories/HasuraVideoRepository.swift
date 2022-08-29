//
//  HasuraVideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Videos
 */
class HasuraVideoRepository: VideoRepository {
    let graphQLService: SDOGraphQLService
    
    init(graphQLService: SDOGraphQLService) {
        self.graphQLService = graphQLService
    }
    
    /// Gets the data needed for the home screen
    func getHomeScreenData(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(
                query: GetHomeScreenDataQuery(uuid: userUuid)).toEntity()
            return .success(data)
        } catch {
            AppLogger.error("Error in getHomeScreenData: \(error)")
            return .failure(BusinessErrors.serverError())
        }
    }
    
    /// Gets detailed informational video data
    func getVideoDetailInfoData(videoId: String, channelId: String) async -> Result<VideoDetailInfoData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(
                query: GetVideoDetailDataQuery(videoId: videoId, channelId: channelId)).toEntity()
            return .success(data)
        } catch {
            AppLogger.error("Error in getVideoDetailData: \(error)")
            return .failure(BusinessErrors.serverError())
        }
    }
}
