//
//  GetSignedUrlForVideoDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 30/08/2022.
//

import Foundation

extension GetSignedUrlForVideoMutation.Data {
    func toEntity() throws -> URL {
        guard let signedUrl = URL(string: generateSignedUrlForVideo.signedUrl) else {
            throw BusinessErrors.parsingError()
        }
        return signedUrl
    }
}
