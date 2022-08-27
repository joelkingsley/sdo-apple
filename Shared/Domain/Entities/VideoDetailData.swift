//
//  VideoDetailData.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation

struct VideoDetailData {
    enum VideoType: String {
        case sermon = "videoDetailVideoTypeSermon"
        case documentary = "videoDetailVideoTypeDocumentary"
        case short = "videoDetailVideoTypeShort"
        case music = "videoDetailVideoTypeMusic"
        
        func localizedString() -> String {
            return String(localized: String.LocalizationValue(self.rawValue))
        }
    }
    
    struct SpeakerData {
        let speakerId: String
        let speakerName: String
    }
    
    struct RelatedVideo: ThumbnailableVideo, Identifiable {
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
        let videoId: String
        let title: String
        let channelName: String
        let thumbnailURL: URL
        let datePublished: Date
        let views: Int
    }
    
    struct LanguageData {
        let languageName: String
        let sourceCountryFlag: String
    }
    
    let videoId: String
    let title: String
    let thumbnailURL: URL
    let videoType: VideoType
    let datePublished: Date
    let description: String
    let speaker: SpeakerData
    let subscriptionsVideoBelongsTo: [SubscriptionData]
    let relatedVideos: [RelatedVideo]
    let language: LanguageData
}

extension VideoDetailData: TopPreviewableVideo {
    var subscriptionsForWatching: [SubscriptionData] {
        return subscriptionsVideoBelongsTo
    }
    
    var canUserWatch: Bool {
        return true
    }
    
    var speakerName: String {
        return speaker.speakerName
    }
    
    var localizedType: String {
        let type = videoType.localizedString()
        return type
    }
}
