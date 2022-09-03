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
        async let infoDataResult = videoRepository.getVideoDetailInfoData(videoId: videoId, channelId: channelId)
        async let signedUrlResult = videoRepository.getSignedUrlForVideo(ofVideoId: videoId)
        
        do {
            let infoData = try await infoDataResult.get()
            do {
                let signedUrl = try await signedUrlResult.get()
                // TODO: Retrieve and set subscription data
                let subscriptionData = VideoDetailSubscriptionData(
                    signedUrl: signedUrl,
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
                    VideoDetailData(infoData: infoData, subscriptionData: subscriptionData)
                )
            } catch {
                // TODO: Retrieve and set subscription data
                if let customError = error as? BusinessErrors.customError {
                    AppLogger.error(customError.localizedDescription)
                    switch customError.code {
                    case "TOKEN_INVALID":
                        return .failure(BusinessErrors.unauthorized())
                    case "SERVER_ERROR":
                        return .failure(BusinessErrors.serverError())
                    case "SIGNING_URL_ERROR":
                        return .failure(BusinessErrors.serverError())
                    case "VIDEO_NOT_ACCESSIBLE_TO_USER":
                        let subscriptionData = VideoDetailSubscriptionData(
                            signedUrl: nil,
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
                            VideoDetailData(infoData: infoData, subscriptionData: subscriptionData)
                        )
                    default:
                        return .failure(BusinessErrors.serverError())
                    }
                }
                return .failure(BusinessErrors.unknownError())
            }
        } catch {
            return .failure(error)
        }
    }
}
