//
//  GetVideosForHomeScreenDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

extension GetHomeScreenDataQuery.Data {
    func toEntity() throws -> HomeScreenInfoData {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let continueWatchingVideos = try continueWatching.map { $0.video }.map { video -> HomeScreenInfoData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenInfoData.HomeVideo(
                infoData: HomeScreenInfoData.HomeVideo.HomeVideoInfoData(
                    videoId: video.videoId,
                    title: video.title,
                    channelId: video.channel.channelId,
                    channelName: video.channel.channelName,
                    datePublished: datePublished,
                    speakerName: video.speaker.speakerName
                )
            )
        }
        let userListVideos = try userList.map { $0.video }.map { video -> HomeScreenInfoData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenInfoData.HomeVideo(
                infoData: HomeScreenInfoData.HomeVideo.HomeVideoInfoData(
                    videoId: video.videoId,
                    title: video.title,
                    channelId: video.channel.channelId,
                    channelName: video.channel.channelName,
                    datePublished: datePublished,
                    speakerName: video.speaker.speakerName
                )
            )
        }
        let newReleaseVideos = try newReleases.map { video -> HomeScreenInfoData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished) else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenInfoData.HomeVideo(
                infoData: HomeScreenInfoData.HomeVideo.HomeVideoInfoData(
                    videoId: video.videoId,
                    title: video.title,
                    channelId: video.channel.channelId,
                    channelName: video.channel.channelName,
                    datePublished: datePublished,
                    speakerName: video.speaker.speakerName
                )
            )
        }
        return HomeScreenInfoData(
            continueWatchingVideos: continueWatchingVideos,
            userListVideos: userListVideos,
            newReleasesVideos: newReleaseVideos
        )
    }
}
