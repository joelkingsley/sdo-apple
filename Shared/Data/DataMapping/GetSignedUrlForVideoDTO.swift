//
//  GetSignedUrlForVideoDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

extension GetSignedUrlForVideoMutation.Data {
    func toEntity() throws -> VideoUrlData {
        guard let thumbnailUrl = URL(string: generateSignedUrlForVideo.thumbnailUrl)
        else {
            throw BusinessErrors.parsingError()
        }
        let videoUrl = URL(string: generateSignedUrlForVideo.videoUrl)
        let isVideoAccessibleToUser = generateSignedUrlForVideo.isVideoAccessibleToUser
        return VideoUrlData(
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            isVideoAccessibleToUser: isVideoAccessibleToUser
        )
    }
}
