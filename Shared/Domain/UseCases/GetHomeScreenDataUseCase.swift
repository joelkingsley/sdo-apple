//
//  GetHomeScreenDataUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

/**
 Retrieves the home screen data
 */
class GetHomeScreenDataUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(userUuid: String) async -> Result<HomeScreenData, BusinessError> {
        return await videoRepository.getHomeScreenData(userUuid: userUuid)
    }
}
