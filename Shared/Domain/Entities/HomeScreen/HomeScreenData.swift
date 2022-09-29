//
//  HomeScreenData.swift
//  SDO
//
//  Created by Joel Kingsley on 26/08/2022.
//

import Foundation

struct HomeScreenData {
    struct HomeVideo: Identifiable {
        struct HomeVideoInfoData {
            let videoId: String
            let title: String
            let channelId: String
            let channelName: String
            let datePublished: Date
            let speakerName: String
        }
        
        struct HomeVideoThumbnailData {
            let thumbnailURL: URL
        }
        
        var id: UUID {
            return UUID(uuidString: infoData.videoId) ?? UUID()
        }
        let infoData: HomeVideoInfoData
        let thumbnailData: HomeVideoThumbnailData
    }
    
    let continueWatchingVideos: [HomeVideo]
    let userListVideos: [HomeVideo]
    let newReleasesVideos: [HomeVideo]
}

extension HomeScreenData.HomeVideo: ThumbnailableVideo {
    var title: String {
        infoData.title
    }
    
    var channelName: String {
        infoData.channelName
    }
    
    var datePublished: Date {
        infoData.datePublished
    }
    
    var speakerName: String {
        infoData.speakerName
    }
    
    var thumbnailURL: URL {
        thumbnailData.thumbnailURL
    }
}
