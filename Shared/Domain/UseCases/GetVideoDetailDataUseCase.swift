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
        async let urlDataResult = videoRepository.getSignedUrlsForVideo(ofVideoId: videoId)
        
        do {
            let infoData = try await infoDataResult.get()
            let urlData = try await urlDataResult.get()
            
            /**
             Fetch and map video details and  thumbnail details of related videos
             */
            let thumbnailDetailsOfRelatedVideos = try await videoRepository.getSignedThumbnailDetailsForVideos(
                ofVideoIds: infoData.relatedVideos.map { $0.infoData.videoId }).get()
            let relatedVideoThumbnailMapping = try infoData.relatedVideos.map { relatedVideo in
                guard let thumbnailDetails = thumbnailDetailsOfRelatedVideos.first(where: { $0.videoId == relatedVideo.infoData.videoId }) else {
                    throw BusinessErrors.parsingError()
                }
                return (relatedVideo, thumbnailDetails.thumbnailUrl)
            }
            let relatedVideos = relatedVideoThumbnailMapping.map { (relatedVideo, thumbnailURL) in
                return VideoDetailData.RelatedVideo(infoRelatedVideo: relatedVideo, thumbnailURL: thumbnailURL)
            }
            
            // TODO: Retrieve and set subscription data
            let subscriptionData = VideoDetailSubscriptionData(
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
                VideoDetailData(
                    videoId: infoData.videoId,
                    title: infoData.title,
                    videoType: VideoDetailData.VideoType(infoVideoType: infoData.videoType),
                    datePublished: infoData.datePublished,
                    description: infoData.description,
                    speaker: VideoDetailData.SpeakerData(infoSpeakerData: infoData.speaker),
                    channel: infoData.channel,
                    relatedVideos: relatedVideos,
                    language: VideoDetailData.LanguageData(infoLanguageData: infoData.language),
                    subscriptionData: subscriptionData,
                    urlData: urlData
                ))
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetVideoDetailDataUseCase())
            }
            return .failure(error)
        }
    }
}
