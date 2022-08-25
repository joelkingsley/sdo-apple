//
//  VideoData.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import Foundation

struct VideoData: Identifiable, ThumbnailableVideo {
    var id: UUID {
        return UUID(uuidString: videoId) ?? UUID()
    }
    
    let videoId: String
    let videoTitle: String
    let videoDescription: String
    let videoType: VideoTypeData
    let channel: ChannelData
    let speaker: SpeakerData
    let language: LanguageData
    let thumbnailURL: URL
    let datePublished: Date
    let views: Int
    let gcpStorageFileName: String
    let gcpStorageBucketName: String
    var categories: [String] = []
}

enum VideoTypeData {
    case sermon
    case documentary
    case short
    case music
}
