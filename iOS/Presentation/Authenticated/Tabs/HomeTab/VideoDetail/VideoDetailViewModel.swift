//
//  VideoDetailViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

@MainActor
class VideoDetailViewModel: ObservableObject {
    let getVideoDetailDataUseCase = GetVideoDetailDataUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    var videoId: String!
    var channelId: String!
    
    @Published var videoDetailData: Result<VideoDetailData, BusinessError>?
    
    func onLoaded() {
        Task {
            await getVideoDetailData()
        }
    }
    
    func getVideoDetailData() async {
        switch await getVideoDetailDataUseCase.execute(videoId: videoId, channelId: channelId) {
        case let .success(data):
            AppLogger.debug(data)
            videoDetailData = .success(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            videoDetailData = .failure(error)
        }
    }
}
