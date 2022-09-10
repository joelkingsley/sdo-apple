//
//  VideoDetailData.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation

struct VideoDetailData {
    let infoData: VideoDetailInfoData
    let subscriptionData: VideoDetailSubscriptionData
    let urlData: VideoUrlData
}

extension VideoDetailData: TopPreviewableVideo {
    var title: String {
        return infoData.title
    }
    
    var thumbnailURL: URL {
        return urlData.thumbnailUrl
    }
    
    var datePublished: Date {
        return infoData.datePublished
    }
    
    var description: String {
        return infoData.description
    }
    
    var canUserWatch: Bool {
        return urlData.isVideoAccessibleToUser && urlData.videoUrl != nil
    }
    
    var allAccessSubscription: SubscriptionData {
        return subscriptionData.allAccessSubscription
    }
    
    var subscriptionForWatching: SubscriptionData? {
        return subscriptionData.subscriptionVideoBelongsTo
    }

    var speakerName: String {
        return infoData.speaker.speakerName
    }
    
    var localizedType: String {
        let type = infoData.videoType.localizedString()
        return type
    }
    
    var signedUrl: URL? {
        return urlData.videoUrl
    }
}