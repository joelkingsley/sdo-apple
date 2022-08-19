//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    init() {
        Task {
            await getAllChannels()
        }
    }
    
    let channelRepository: ChannelRepository = HasuraChannelRepository(graphQLService: HasuraGraphQLService())
    
    func getAllChannels() async {
        let result = await channelRepository.getAllChannels()
        switch result {
        case let .success(data):
            AppLogger.debug(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
        }
    }
}
