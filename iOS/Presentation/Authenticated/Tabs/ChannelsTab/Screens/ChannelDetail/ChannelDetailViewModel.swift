//
//  ChannelDetailViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 01/11/2022.
//

import Foundation

@MainActor
class ChannelDetailViewModel: ObservableObject {
    private let getChannelDetailDataUseCase = GetChannelsDetailDataUseCase(
        channelsRepository: HasuraChannelRepository(
            graphQLService: HasuraGraphQLService()))
    
    let channelId: String?
    @Published var channelDetailData: Result<ChannelDetailData, BusinessError>?
    
    init(channelId: String?) {
        self.channelId = channelId
    }
    
    func onLoaded() {
        guard let channelId else { return }
        Task {
            switch await getChannelDetailDataUseCase.execute(channelId: channelId) {
            case let .success(data):
                AppLogger.debug(data)
                self.channelDetailData = .success(data)
            case let .failure(error):
                AppLogger.error(error.localizedDescription)
                self.channelDetailData = .failure(error)
            }
        }
    }
}
