//
//  VideoDetailInfoData.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

struct VideoDetailInfoData {
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
        let languageCode: String
        let sourceCountryFlag: String
        
        var languageName: String {
            return Locale.current.localizedString(forLanguageCode: languageCode) ?? "N/A"
        }
    }
    
    let videoId: String
    let title: String
    let thumbnailURL: URL
    let videoType: VideoType
    let datePublished: Date
    let description: String
    let speaker: SpeakerData
    let channel: ChannelData
    let relatedVideos: [RelatedVideo]
    let language: LanguageData
}
