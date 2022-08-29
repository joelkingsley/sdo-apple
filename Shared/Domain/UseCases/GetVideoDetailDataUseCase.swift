//
//  GetVideoDetailDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/**
 Sets up and returns the video detail data
 */
class GetVideoDetailDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(videoId: String, channelId: String) async -> Result<VideoDetailData, BusinessError> {
        let infoDataResult = await videoRepository.getVideoDetailInfoData(videoId: videoId, channelId: channelId)
        switch infoDataResult {
        case let .success(infoData):
            // TODO: Retrieve and set subscription data
            let subscriptionData = VideoDetailSubscriptionData(
                canUserWatch: true,
                subscriptionVideoBelongsTo: nil,
                allAccessSubscription: SubscriptionData(
                    subscriptionId: "",
                    subscriptionName: "",
                    subscriptionCost: 0,
                    currencyCode: "",
                    eligibleForTrial: false,
                    timeIntervalOfTrial: 0
                )
            )
            return .success(
                VideoDetailData(infoData: infoData, subscriptionData: subscriptionData))
        case let .failure(error):
            return .failure(error)
        }
    }
}
