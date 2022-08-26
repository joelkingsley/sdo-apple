//
//  GetAllChannelsDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 15/08/2022.
//

import Foundation

extension GetAllChannelsQuery.Data.Channel: Identifiable {
    public var id: UUID {
        return UUID(uuidString: channelId) ?? UUID()
    }
}
