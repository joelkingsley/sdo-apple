//
//  GetVideoDetailInfoDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

extension GetVideoDetailDataQuery.Data {
    func toEntity() throws -> VideoDetailData.InfoData {
        let videoDetails = videoDetail
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let videoDetail = videoDetails.first,
              let datePublished = formatter.date(from: videoDetail.datePublished),
              let thumbnailUrl = videoDetail.thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }
        return VideoDetailData.InfoData(
            videoId: videoDetail.videoId,
            title: videoDetail.title,
            videoType: try videoDetail.videoType.toEntity(),
            datePublished: datePublished,
            description: videoDetail.description,
            speaker: videoDetail.speaker.toEntity(),
            channel: try videoDetail.channel.toEntity(),
            moreVideosInChannel: try moreVideosInChannel.map { try $0.toEntity() },
            language: videoDetail.language.toEntity(),
            thumbnailURL: thumbnailUrl,
            likedByUser: videosLikesDislikes.first?.liked
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Speaker {
    func toEntity() -> VideoDetailData.SpeakerData {
        return VideoDetailData.SpeakerData(
            speakerId: speakerId,
            speakerName: speakerName
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Channel {
    func toEntity() throws -> ChannelData {
        return ChannelData(
            channelId: channelId,
            channelName: channelName,
            channelType: try channelType.toEntity()
        )
    }
}

extension channel_types_enum {
    func toEntity() throws -> ChannelTypeData {
        switch self {
        case .church:
            return .church
        case .soulWinningClub:
            return .soulWinningClub
        case .__unknown(let rawValue):
            AppLogger.error("Unexpectedly got invalid option for channel_types_enum: \(rawValue)")
            throw BusinessErrors.parsingError()
        }
    }
}

extension GetVideoDetailDataQuery.Data.MoreVideosInChannel {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
    
    func toEntity() throws -> VideoDetailData.RelatedVideo {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let datePublished = formatter.date(from: datePublished),
              let thumbnailUrl = thumbnailUrl
        else {
            throw BusinessErrors.parsingError()
        }

        return VideoDetailData.RelatedVideo(
            videoId: videoId,
            title: title,
            channelId: channel.channelId,
            channelName: channel.channelName,
            datePublished: datePublished,
            speakerName: speaker.speakerName,
            thumbnailURL: thumbnailUrl
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Language {
    func toEntity() -> LanguageData {
        return LanguageData(
            languageCode: languageCode,
            sourceCountryFlag: sourceCountryFlag
        )
    }
}

extension video_types_enum {
    func toEntity() throws -> VideoType {
        switch self {
        case .documentary:
            return .documentary
        case .music:
            return .music
        case .sermon:
            return .sermon
        case .short:
            return .short
        case .__unknown(let rawValue):
            AppLogger.error("Unexpectedly got invalid option for video_types_enum: \(rawValue)")
            throw BusinessErrors.parsingError()
        }
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}
