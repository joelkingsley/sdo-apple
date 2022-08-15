//
//  GetAllChannelsDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

extension GetAllChannelsQuery.Data.Channel {
    func toEntity() throws -> ChannelData {
        return ChannelData(
            channelId: channelId,
            channelName: channelName,
            channelTypeName: try channelType.toEntity()
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
            AppLogger.error("Unexpectedly got \(rawValue) in channel_types_enum")
            throw BusinessErrors.parsingError()
        }
    }
}
