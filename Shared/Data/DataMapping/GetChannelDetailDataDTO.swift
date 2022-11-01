//
//  GetChannelDetailDataDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import Foundation

extension GetChannelDetailQuery.Data {
    func toEntity() throws -> ChannelDetailData {
        guard let channel = channels.first,
              let latitude = Double(channel.locationLat),
              let longitude = Double(channel.locationLong)
        else {
            throw BusinessErrors.parsingError()
        }
        return ChannelDetailData(
            channelId: channel.channelId,
            channelName: channel.channelName,
            channelType: try channel.channelType.toEntity(),
            location: ChannelDetailData.Location(
                latitude: latitude,
                longitude: longitude
            ),
            regionCode: channel.regionCode,
            videosInChannel: try channel.videosInChannel.map { try $0.toEntity(channelName: channel.channelName) }
        )
    }
}

extension GetChannelDetailQuery.Data.Channel.VideosInChannel {
    func toEntity(channelName: String) throws -> ChannelDetailData.Video {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        guard let thumbnailUrl,
              let datePublished = formatter.date(from: datePublished)
        else {
            throw BusinessErrors.parsingError()
        }
        return ChannelDetailData.Video(
            videoId: videoId,
            title: title,
            videoType: try videoType.toEntity(),
            channelName: channelName,
            speaker: ChannelDetailData.Video.Speaker(
                speakerId: speaker.speakerId,
                speakerName: speaker.speakerName
            ),
            language: ChannelDetailData.Video.Language(
                languageCode: language.languageCode,
                sourceCountryFlag: language.sourceCountryFlag
            ),
            thumbnailUrl: thumbnailUrl,
            description: description,
            datePublished: datePublished
        )
    }
}

extension GetChannelDetailQuery.Data.Channel.VideosInChannel {
    var thumbnailUrl: URL? {
        let baseUrl = ApiConstants.googleCloudStorageBaseUrl
        return URL(string: "\(baseUrl)/\(gcpThumbnailBucketName)/\(gcpThumbnailFileName)")
    }
}
