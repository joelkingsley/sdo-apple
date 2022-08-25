//
//  HomeTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation
import SwiftUI

@MainActor
class HomeTabViewModel: ObservableObject {
    private let videoRepository: VideoRepository = HasuraVideoRepository(graphQLService: HasuraGraphQLService())
    private let channelRepository: ChannelRepository = HasuraChannelRepository(graphQLService: HasuraGraphQLService())
    private let authViewModel: AuthenticationViewModel
    
    @Published var homeScreenData: GetDataForHomeScreenQuery.Data?
    
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
        Task {
            await getAllChannels()
        }
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
    
    func onLoaded() async {
        guard let user = authViewModel.getUser() else {
            return
        }
        switch await videoRepository.getDataForHomeScreen(userUuid: user.uid) {
        case let .success(data):
            AppLogger.debug(data)
            homeScreenData = data
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
        }
    }
}
