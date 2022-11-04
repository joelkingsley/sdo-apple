//
//  GetVideosOfSearchParametersDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 06/10/2022.
//

import Foundation

extension GetVideosForSearchTextQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videosAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try videos.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: videoId,
            title: title,
            channelId: channel.channelId,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try videoType.toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
    
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetVideosForSearchTextAndVideoTypeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videosAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try videos.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndVideoTypeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: videoId,
            title: title,
            channelId: channel.channelId,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try videoType.toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
    
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension video_types_enum {
    init(videoType: VideoType) {
        switch videoType {
        case .sermon:
            self = .sermon
        case .documentary:
            self = .documentary
        case .short:
            self = .short
        case .music:
            self = .music
        }
    }
}

extension GetVideosForSearchTextVideoTypeAndLanguageCodeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videosAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try videos.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndLanguageCodeQuery.Data {
    func toEntity() throws -> SearchResultData {
        guard let count = videosAggregate.aggregate?.count else {
            throw BusinessErrors.parsingError()
        }
        return SearchResultData(
            videos: try videos.map({ video in
                try video.toEntity()
            }),
            totalNumberOfVideos: count
        )
    }
}

extension GetVideosForSearchTextAndLanguageCodeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: videoId,
            title: title,
            channelId: channel.channelId,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try videoType.toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
    
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}

extension GetVideosForSearchTextVideoTypeAndLanguageCodeQuery.Data.Video {
    func toEntity() throws -> SearchResultData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let date = formatter.date(from: datePublished),
              let thumbnailUrl = thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }
        
        return SearchResultData.Video(
            videoId: videoId,
            title: title,
            channelId: channel.channelId,
            channelName: channel.channelName,
            datePublished: date,
            speakerName: speaker.speakerName,
            videoType: try videoType.toEntity(),
            thumbnailURL: thumbnailUrl
        )
    }
    
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}
