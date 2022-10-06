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
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
    
    /// Gets detailed informational video data
    func getVideoDetailInfoData(videoId: String, channelId: String) async -> Result<VideoDetailData.InfoData, BusinessError> {
        do {
            let data = try await graphQLService.executeQuery(
                query: GetVideoDetailDataQuery(videoId: videoId, channelId: channelId)).toEntity()
            return .success(data)
        } catch {
            AppLogger.error("Error in getVideoDetailInfoData: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
    
    /// Gets signed url of given video
    func getSignedUrlOfVideo(ofVideoId videoId: String) async -> Result<URL?, BusinessError> {
        do {
            let data = try await graphQLService.executeMutation(
                mutation: GetVideoUrlDataMutation(videoId: videoId)).toEntity()
            return .success(data)
        } catch {
            AppLogger.error("Error in getSignedUrlsForVideo: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
    
    /// Gets the videos based on the given search parameters
    func getVideosOfSearchParameters(
        ofSearchResultInputData inputData: SearchResultInputData
    ) async -> Result<SearchResultData, BusinessError> {
        do {
            if let videoType = inputData.videoType
            {
                let data = try await graphQLService.executeQuery(query: GetVideosForSearchTextAndVideoTypeQuery(
                    searchText: "%\(inputData.searchText)%",
                    videoType: video_types_enum(videoType: videoType),
                    limit: inputData.limit,
                    offset: inputData.offset
                )).toEntity()
                return .success(data)
            } else {
                let data = try await graphQLService.executeQuery(query: GetVideosForSearchTextQuery(
                    searchText: "%\(inputData.searchText)%",
                    limit: inputData.limit,
                    offset: inputData.offset
                )).toEntity()
                return .success(data)
            }
        } catch {
            AppLogger.error("Error in getVideosOfSearchParameters: \(error)")
            return .failure(GraphQLErrorTransformer.transform(apiError: error))
        }
    }
}
