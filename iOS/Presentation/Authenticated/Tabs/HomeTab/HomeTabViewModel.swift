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
    
    @Published var homeScreenData: Result<HomeScreenData, BusinessError>?
    
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
    }
    
    func onLoaded() {
        Task {
            await getDataForHomeScreen()
        }
    }
    
    private func getDataForHomeScreen() async {
        guard let user = authViewModel.getUser() else {
            return
        }
        switch await videoRepository.getDataForHomeScreen(userUuid: user.uid) {
        case let .success(data):
            AppLogger.debug(data)
            homeScreenData = .success(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            homeScreenData = .failure(error)
        }
    }
}
