//
//  VideoDetailViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

class VideoDetailViewModel: ObservableObject {
    let getVideoDetailDataUseCase: GetVideoDetailDataUseCase
    
    var videoId: String!
    var channelId: String!
    
    @Published var videoDetailData: Result<VideoDetailData, BusinessError>?
    
    init(getVideoDetailDataUseCase: GetVideoDetailDataUseCase) {
        self.getVideoDetailDataUseCase = getVideoDetailDataUseCase
    }
    
    func onLoaded() {
        Task {
            await getVideoDetailData()
        }
    }
    
    func getVideoDetailData() async {
        self.videoDetailData = await getVideoDetailDataUseCase.execute(videoId: videoId, channelId: channelId)
    }
}
