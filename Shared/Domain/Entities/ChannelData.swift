//
//  ChannelData.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

struct ChannelData {
    let channelId: String
    let channelName: String
    let channelTypeName: ChannelTypeData
}

enum ChannelTypeData {
    case church
    case soulWinningClub
}
