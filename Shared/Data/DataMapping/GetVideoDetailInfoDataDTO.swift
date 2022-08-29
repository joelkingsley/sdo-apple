//
//  GetVideoDetailInfoDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

extension GetVideoDetailDataQuery.Data {
    func toEntity() throws -> VideoDetailInfoData {
        let videoDetails = videoDetail
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let videoDetail = videoDetails.first,
              let datePublished = formatter.date(from: videoDetail.datePublished)
        else {
            throw BusinessErrors.parsingError()
        }
        return VideoDetailInfoData(
            videoId: videoDetail.videoId,
            title: videoDetail.title,
            thumbnailURL: URL(string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
            videoType: try videoDetail.videoType.toEntity(),
            datePublished: datePublished,
            description: videoDetail.description,
            speaker: videoDetail.speaker.toEntity(),
            channel: try videoDetail.channel.toEntity(),
            relatedVideos: try relatedVideos.map { try $0.toEntity() },
            language: videoDetail.language.toEntity()
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Speaker {
    func toEntity() -> VideoDetailInfoData.SpeakerData {
        return VideoDetailInfoData.SpeakerData(
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

extension GetVideoDetailDataQuery.Data.RelatedVideo {
    func toEntity() throws -> VideoDetailInfoData.RelatedVideo {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let datePublished = formatter.date(from: datePublished) else {
            throw BusinessErrors.parsingError()
        }
        return VideoDetailInfoData.RelatedVideo(
            videoId: videoId,
            title: title,
            channelName: channel.channelName,
            thumbnailURL: URL(
                string: "https://i0.wp.com/seelen-gewinnen.de/wp-content/uploads/2022/03/Gruppenfoto-ohne-Hintergrund.jpg?fit=768%2C576&ssl=1")!,
            datePublished: datePublished,
            views: views
        )
    }
}

extension GetVideoDetailDataQuery.Data.VideoDetail.Language {
    func toEntity() -> VideoDetailInfoData.LanguageData {
        return VideoDetailInfoData.LanguageData(
            languageCode: languageCode,
            sourceCountryFlag: sourceCountryFlag
        )
    }
}

extension video_types_enum {
    func toEntity() throws -> VideoDetailInfoData.VideoType {
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
