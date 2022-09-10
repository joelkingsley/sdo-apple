//
//  GetSignedUrlForVideoDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

extension GetVideoUrlDataMutation.Data {
    func toEntity() throws -> VideoUrlData {
        guard let thumbnailUrl = URL(string: getVideoUrlData.thumbnailUrl) else {
            throw BusinessErrors.parsingError()
        }
        let videoUrl = URL(string: getVideoUrlData.videoUrl)
        let isVideoAccessibleToUser = getVideoUrlData.isVideoAccessibleToUser
        return VideoUrlData(
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            isVideoAccessibleToUser: isVideoAccessibleToUser
        )
    }
}
