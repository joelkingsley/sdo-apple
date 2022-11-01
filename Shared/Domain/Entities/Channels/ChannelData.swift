//
//  ChannelData.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

struct ChannelData {
    let channelId: String
    let channelName: String
    let channelType: ChannelTypeData
}

enum ChannelTypeData: String {
    case church = "channelsTypeChurchLabel"
    case soulWinningClub = "channelsTypeSoulWinningLabel"
    
    func localizedString() -> String {
        return String(localized: String.LocalizationValue(self.rawValue))
    }
}
