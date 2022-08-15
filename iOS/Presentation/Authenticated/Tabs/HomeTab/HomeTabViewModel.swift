//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import SwiftUI

class HomeTabViewModel: ObservableObject {
    @Published
    var videos: [String: [VideoData]] = [
        "Your List": [exampleVideo1, exampleVideo2],
        "Popular on SDO": [exampleVideo1, exampleVideo2, exampleVideo1, exampleVideo2],
        "Continue Watching": [exampleVideo1, exampleVideo2],
        "New Releases": [exampleVideo1, exampleVideo2],
        "Short Clips": [exampleVideo2]
    ]
    
    init() {
        Task {
            await getAllChannels()
        }
    }
    
    let channelRepository: ChannelRepository = HasuraChannelRepository(graphQLService: HasuraGraphQLService())
    
    var allCategories: [String] {
        return videos.keys.map({ String($0) })
    }
    
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
