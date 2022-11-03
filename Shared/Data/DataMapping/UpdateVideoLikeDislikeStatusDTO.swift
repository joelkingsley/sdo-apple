//
//  UpdateVideoLikeDislikeStatusDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension UpdateVideoLikeDislikeStatusMutation.Data {
    func toEntity() throws -> UpdateVideoLikeDislikeResponseData {
        guard let insertVideosLikesDislikesOne else {
            throw BusinessErrors.parsingError()
        }
        return UpdateVideoLikeDislikeResponseData(liked: insertVideosLikesDislikesOne.liked)
    }
}
