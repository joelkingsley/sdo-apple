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
        
        let documentaryVideos = try documentaries.map { video -> HomeScreenData.HomeVideo in
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
        
        let sermonVideos = try sermons.map { video -> HomeScreenData.HomeVideo in
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
        
        let shortVideos = try shorts.map { video -> HomeScreenData.HomeVideo in
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
        
        let music = try musicVideos.map { video -> HomeScreenData.HomeVideo in
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
            documentaries: documentaryVideos,
            sermons: sermonVideos,
            shorts: shortVideos,
            musicVideos: music
        )
    }
}

extension GetHomeScreenDataQuery.Data.Documentary {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetHomeScreenDataQuery.Data.Sermon {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetHomeScreenDataQuery.Data.Short {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetHomeScreenDataQuery.Data.MusicVideo {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}
