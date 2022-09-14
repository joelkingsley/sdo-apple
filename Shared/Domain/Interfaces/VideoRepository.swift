//
//  VideoRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 24/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Videos
 */
protocol VideoRepository {
    /// Gets the data needed for the home screen
    func getHomeScreenInfoData(userUuid: String) async -> Result<HomeScreenInfoData, BusinessError>
    
    /// Gets detailed informational video data
    func getVideoDetailInfoData(videoId: String, channelId: String) async -> Result<VideoDetailInfoData, BusinessError>
    
    /// Gets signed urls for a given video
    func getSignedUrlsForVideo(ofVideoId videoId: String) async -> Result<VideoUrlData, BusinessError>
    
    /// Gets signed thumbnail details for given videos
    func getSignedThumbnailDetailsForVideos(
        ofVideoIds videoIds: [String]
    ) async -> Result<[VideoThumbnailDetails], BusinessError>
}
