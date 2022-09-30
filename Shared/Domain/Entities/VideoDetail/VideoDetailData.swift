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
    
    struct RelatedVideo: Identifiable, ThumbnailableVideo {
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
        
        let videoId: String
        let title: String
        let channelName: String
        let datePublished: Date
        let speakerName: String
        let thumbnailURL: URL
    }
    
    struct LanguageData {
        let languageCode: String
        let sourceCountryFlag: String
        
        var languageName: String {
            return Locale.current.localizedString(forLanguageCode: languageCode) ?? "N/A"
        }
    }
    
    struct InfoData {
        let videoId: String
        let title: String
        let videoType: VideoType
        let datePublished: Date
        let description: String
        let speaker: SpeakerData
        let channel: ChannelData
        let relatedVideos: [RelatedVideo]
        let language: LanguageData
        let thumbnailURL: URL
    }
    
    let infoData: InfoData
    
    let videoUrl: URL?
    
    let subscriptionVideoBelongsTo: SubscriptionData?
    let allAccessSubscription: SubscriptionData
    
    var isVideoAccessibleToUser: Bool {
        // TODO: Check if user is subscribed to `subscriptionVideoBelongsTo` or `allAccessSubscription`
        guard subscriptionVideoBelongsTo != nil else {
            return true
        }
        return true
    }
}

extension VideoDetailData: TopPreviewableVideo {
    var title: String {
        infoData.title
    }
    
    var thumbnailURL: URL {
        infoData.thumbnailURL
    }
    
    var datePublished: Date {
        infoData.datePublished
    }
    
    var description: String {
        infoData.description
    }
    
    var canUserWatch: Bool {
        return isVideoAccessibleToUser && videoUrl != nil
    }
    
    var subscriptionForWatching: SubscriptionData? {
        return subscriptionVideoBelongsTo
    }

    var speakerName: String {
        return infoData.speaker.speakerName
    }
    
    var localizedType: String {
        let type = infoData.videoType.localizedString()
        return type
    }
    
    var signedUrl: URL? {
        return videoUrl
    }
}
