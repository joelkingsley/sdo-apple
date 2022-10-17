//
//  GetAllChannelsDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

extension GetAllChannelsQuery.Data {
    func toEntity() throws -> GetChannelsData {
        return GetChannelsData(
            channels: try channels.map { try $0.toEntity() }
        )
    }
}

extension GetAllChannelsQuery.Data.Channel {
    func toEntity() throws -> GetChannelsData.ChannelData {
        guard let latitude = Double(locationLat),
              let longitude = Double(locationLong)
        else {
            throw BusinessErrors.parsingError()
        }
        return GetChannelsData.ChannelData(
            channelId: channelId,
            channelName: channelName,
            type: try channelType.toEntity(),
            location: GetChannelsData.ChannelData.Location(
                latitude: latitude,
                longitude: longitude
            ),
            regionCode: regionCode
        )
    }
}
