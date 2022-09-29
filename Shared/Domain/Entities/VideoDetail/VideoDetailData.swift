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
    
    struct RelatedVideo: Identifiable {
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
    
    let videoId: String
    let title: String
    let videoType: VideoType
    let datePublished: Date
    let description: String
    let speaker: SpeakerData
    let channel: ChannelData
    let relatedVideos: [RelatedVideo]
    let language: LanguageData
    
    let subscriptionData: VideoDetailSubscriptionData
    let urlData: VideoUrlData
}

extension VideoDetailData: TopPreviewableVideo {
    var thumbnailURL: URL {
        return urlData.thumbnailUrl
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
        return speaker.speakerName
    }
    
    var localizedType: String {
        let type = videoType.localizedString()
        return type
    }
    
    var signedUrl: URL? {
        return urlData.videoUrl
    }
}

extension VideoDetailData.VideoType {
    init(infoVideoType: VideoDetailInfoData.VideoType) {
        switch infoVideoType {
        case .sermon:
            self = .sermon
        case .documentary:
            self = .documentary
        case .short:
            self = .short
        case .music:
            self = .music
        }
    }
}

extension VideoDetailData.SpeakerData {
    init(infoSpeakerData: VideoDetailInfoData.SpeakerData) {
        self.init(speakerId: infoSpeakerData.speakerId, speakerName: infoSpeakerData.speakerName)
    }
}

extension VideoDetailData.RelatedVideo: ThumbnailableVideo {
    init(infoRelatedVideo: VideoDetailInfoData.RelatedVideo, thumbnailURL: URL) {
        self.init(
            videoId: infoRelatedVideo.infoData.videoId,
            title: infoRelatedVideo.infoData.title,
            channelName: infoRelatedVideo.infoData.channelName,
            datePublished: infoRelatedVideo.infoData.datePublished,
            speakerName: infoRelatedVideo.infoData.speakerName,
            thumbnailURL: thumbnailURL
        )
    }
}

extension VideoDetailData.LanguageData {
    init(infoLanguageData: VideoDetailInfoData.LanguageData) {
        self.init(languageCode: infoLanguageData.languageCode, sourceCountryFlag: infoLanguageData.sourceCountryFlag)
    }
}
