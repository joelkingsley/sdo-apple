//
//  GetVideosOfSearchParametersUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 01/10/2022.
//

import Foundation

/**
 Sets up and returns the video detail data
 */
class GetVideosOfSearchParametersUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(searchResultInputData: SearchResultInputData) async -> Result<SearchResultData, BusinessError> {
        // TODO: Integrate with API
        return .success(SearchResultData(videos: [
            SearchResultData.Video(
                videoId: exampleVideo1.videoId,
                title: exampleVideo1.title,
                channelId: exampleVideo1.channelId,
                channelName: exampleVideo1.channelName,
                datePublished: exampleVideo1.datePublished,
                speakerName: exampleVideo1.speakerName,
                videoType: .sermon,
                thumbnailURL: exampleVideo1.thumbnailURL
            ),
            SearchResultData.Video(
                videoId: exampleVideo2.videoId,
                title: exampleVideo2.title,
                channelId: exampleVideo2.channelId,
                channelName: exampleVideo2.channelName,
                datePublished: exampleVideo2.datePublished,
                speakerName: exampleVideo2.speakerName,
                videoType: .sermon,
                thumbnailURL: exampleVideo2.thumbnailURL
            )
        ]))
    }
}
