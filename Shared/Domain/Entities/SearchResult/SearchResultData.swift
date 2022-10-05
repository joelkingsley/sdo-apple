//
//  SearchResultData.swift
//  SDO
//
//  Created by Joel Kingsley on 01/10/2022.
//

import Foundation

struct SearchResultData {
    struct Video: Identifiable, ThumbnailableVideo {
        let videoId: String
        let title: String
        let channelId: String
        let channelName: String
        let datePublished: Date
        let speakerName: String
        let videoType: VideoType
        let thumbnailURL: URL
        
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
    }
    
    let videos: [Video]
}
