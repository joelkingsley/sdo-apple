//
//  VideoDetailInfoData.swift
//  SDO
//
//  Created by Joel Kingsley on 29/08/2022.
//

import Foundation

struct VideoDetailInfoData {
    enum VideoType: String {
        case sermon
        case documentary
        case short
        case music
    }
    
    struct SpeakerData {
        let speakerId: String
        let speakerName: String
    }
    
    struct RelatedVideo {
        struct RelatedVideoInfoData {
            let videoId: String
            let title: String
            let channelName: String
            let datePublished: Date
            let speakerName: String
        }
        
        let infoData: RelatedVideoInfoData
    }
    
    struct LanguageData {
        let languageCode: String
        let sourceCountryFlag: String
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
}
