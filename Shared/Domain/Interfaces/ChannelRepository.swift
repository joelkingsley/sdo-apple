//
//  ChannelRepository.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

protocol ChannelRepository {
    func getAllChannels() async -> Result<[GetAllChannelsQuery.Data.Channel], BusinessError>
}
