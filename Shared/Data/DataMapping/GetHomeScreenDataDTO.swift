//
//  GetHomeScreenDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 25/08/2022.
//

import Foundation

extension GetHomeScreenDataQuery.Data {
    func toEntity() throws -> HomeScreenData {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let continueWatchingVideos = try continueWatching.map { $0.video }.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = video.thumbnailUrl
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                datePublished: datePublished,
                speakerName: video.speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        let userListVideos = try userList.map { $0.video }.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = video.thumbnailUrl
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                datePublished: datePublished,
                speakerName: video.speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        let newReleaseVideos = try newReleases.map { video -> HomeScreenData.HomeVideo in
            guard let datePublished = formatter.date(from: video.datePublished),
                  let thumbnailUrl = video.thumbnailUrl
            else {
                throw BusinessErrors.parsingError()
            }
            return HomeScreenData.HomeVideo(
                videoId: video.videoId,
                title: video.title,
                channelId: video.channel.channelId,
                channelName: video.channel.channelName,
                datePublished: datePublished,
                speakerName: video.speaker.speakerName,
                thumbnailURL: thumbnailUrl
            )
        }
        return HomeScreenData(
            continueWatchingVideos: continueWatchingVideos,
            userListVideos: userListVideos,
            newReleasesVideos: newReleaseVideos
        )
    }
}

extension GetHomeScreenDataQuery.Data.ContinueWatching.Video {
    var thumbnailUrl: URL? {
        URL(string: "https://storage.googleapis.com/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetHomeScreenDataQuery.Data.UserList.Video {
    var thumbnailUrl: URL? {
        URL(string: "https://storage.googleapis.com/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetHomeScreenDataQuery.Data.NewRelease {
    var thumbnailUrl: URL? {
        URL(string: "https://storage.googleapis.com/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}
