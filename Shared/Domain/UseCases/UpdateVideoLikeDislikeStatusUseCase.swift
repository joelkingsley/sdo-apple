//
//  UpdateVideoLikeDislikeStatusUseCase.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

class UpdateVideoLikeDislikeStatusUseCase {
    let videoRepository: VideoRepository
    
    init(videoRepository: VideoRepository) {
        self.videoRepository = videoRepository
    }
    
    func execute(payload: VideoLikeDislikeInputData) async -> Result<UpdateVideoLikeDislikeResponseData, BusinessError> {
        return await videoRepository.updateVideoLikeDislikeStatus(withPayload: payload)
    }
}
