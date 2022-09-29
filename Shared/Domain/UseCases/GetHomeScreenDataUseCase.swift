//
//  GetHomeScreenDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/**
 Retrieves the home screen data
 */
class GetHomeScreenDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        do {
            let homeScreenInfoData = try await videoRepository.getHomeScreenInfoData(userUuid: userUuid).get()
            async let videoThumbnailDetailsForContinueWatchingVideosResult = videoRepository.getSignedThumbnailDetailsForVideos(
                ofVideoIds: homeScreenInfoData.continueWatchingVideos.map { $0.infoData.videoId })
            async let videoThumbnailDetailsForUserListVideosResult = videoRepository.getSignedThumbnailDetailsForVideos(
                ofVideoIds: homeScreenInfoData.userListVideos.map { $0.infoData.videoId })
            async let videoThumbnailDetailsForNewReleasesVideosResult = videoRepository.getSignedThumbnailDetailsForVideos(
                ofVideoIds: homeScreenInfoData.newReleasesVideos.map { $0.infoData.videoId })
            
            let thumbnailDetailsContinueWatchingVideos = try await videoThumbnailDetailsForContinueWatchingVideosResult.get()
            let thumbnailDetailsUserListVideos = try await videoThumbnailDetailsForUserListVideosResult.get()
            let thumbnailDetailsNewReleasesVideos = try await videoThumbnailDetailsForNewReleasesVideosResult.get()
            return .success(
                HomeScreenData(
                    continueWatchingVideos: try homeScreenInfoData.continueWatchingVideos.map({ video in
                        guard let thumbnailURL = thumbnailDetailsContinueWatchingVideos.first(
                            where: { $0.videoId == video.infoData.videoId})?.thumbnailUrl
                        else {
                            throw BusinessErrors.parsingError()
                        }
                        return HomeScreenData.HomeVideo(
                            infoData: HomeScreenData.HomeVideo.HomeVideoInfoData(
                                videoId: video.infoData.videoId,
                                title: video.infoData.title,
                                channelId: video.infoData.channelId,
                                channelName: video.infoData.channelName,
                                datePublished: video.infoData.datePublished,
                                speakerName: video.infoData.speakerName
                            ),
                            thumbnailData: HomeScreenData.HomeVideo.HomeVideoThumbnailData(
                                thumbnailURL: thumbnailURL
                            )
                        )
                    }),
                    userListVideos: try homeScreenInfoData.userListVideos.map({ video in
                        guard let thumbnailURL = thumbnailDetailsUserListVideos.first(
                            where: { $0.videoId == video.infoData.videoId})?.thumbnailUrl
                        else {
                            throw BusinessErrors.parsingError()
                        }
                        return HomeScreenData.HomeVideo(
                            infoData: HomeScreenData.HomeVideo.HomeVideoInfoData(
                                videoId: video.infoData.videoId,
                                title: video.infoData.title,
                                channelId: video.infoData.channelId,
                                channelName: video.infoData.channelName,
                                datePublished: video.infoData.datePublished,
                                speakerName: video.infoData.speakerName
                            ),
                            thumbnailData: HomeScreenData.HomeVideo.HomeVideoThumbnailData(
                                thumbnailURL: thumbnailURL
                            )
                        )
                    }),
                    newReleasesVideos: try homeScreenInfoData.newReleasesVideos.map({ video in
                        guard let thumbnailURL = thumbnailDetailsNewReleasesVideos.first(
                            where: { $0.videoId == video.infoData.videoId})?.thumbnailUrl
                        else {
                            throw BusinessErrors.parsingError()
                        }
                        return HomeScreenData.HomeVideo(
                            infoData: HomeScreenData.HomeVideo.HomeVideoInfoData(
                                videoId: video.infoData.videoId,
                                title: video.infoData.title,
                                channelId: video.infoData.channelId,
                                channelName: video.infoData.channelName,
                                datePublished: video.infoData.datePublished,
                                speakerName: video.infoData.speakerName
                            ),
                            thumbnailData: HomeScreenData.HomeVideo.HomeVideoThumbnailData(
                                thumbnailURL: thumbnailURL
                            )
                        )
                    })
                )
            )
        } catch {
            if let customError = error as? BusinessErrors.customError {
                AppLogger.error(customError.localizedDescription)
                return .failure(customError.asErrorForGetHomeScreenDataUseCase())
            }
            return .failure(error)
        }
    }
}
