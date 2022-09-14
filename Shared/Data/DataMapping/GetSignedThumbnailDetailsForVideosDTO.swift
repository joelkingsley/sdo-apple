//
//  GetSignedThumbnailDetailsForVideosDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 11/09/2022.
//

import Foundation

extension GetSignedThumbnailUrlOfVideosMutation.Data {
    func toEntity() throws -> [VideoThumbnailDetails] {
        guard let getSignedThumbnailUrlOfVideos = getSignedThumbnailUrlOfVideos,
              let thumbnailDetails = getSignedThumbnailUrlOfVideos.thumbnailDetails
        else {
            throw BusinessErrors.parsingError()
        }
        return try thumbnailDetails.map({ try $0.toEntity() })
    }
}

extension GetSignedThumbnailUrlOfVideosMutation.Data.GetSignedThumbnailUrlOfVideo.ThumbnailDetail {
    func toEntity() throws -> VideoThumbnailDetails {
        guard let thumbnailUrl = URL(string: thumbnailUrl) else {
            throw BusinessErrors.parsingError()
        }
        return VideoThumbnailDetails(
            videoId: videoId,
            thumbnailUrl: thumbnailUrl
        )
    }
}
