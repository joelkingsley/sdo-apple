//
//  FilterChannelsUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 16/10/2022.
//

import Foundation

class FilterChannelsUseCase {
    func execute(_ channels: [GetChannelsData.ChannelData], withRegion region: Locale.Region) -> [GetChannelsData.ChannelData] {
        /// No filter if region is `world`
        if region == .world {
            return channels
        }

        let regionCode = region.identifier
        return channels.filter { channel in
            regionCode == channel.regionCode ||
            regionCode == Locale.Region(channel.regionCode).containingRegion?.identifier ||
            regionCode == Locale.Region(channel.regionCode).continent?.identifier
        }
    }
}
