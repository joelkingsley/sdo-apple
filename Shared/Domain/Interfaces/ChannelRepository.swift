//
//  ChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

/**
 Repository that performs operations related to Channels
 */
protocol ChannelRepository {
    /// Gets list of all the channels
    func getAllChannels() async -> Result<[GetAllChannelsQuery.Data.Channel], BusinessError>
}
