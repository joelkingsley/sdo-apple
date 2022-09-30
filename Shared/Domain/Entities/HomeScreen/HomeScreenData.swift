//
//  HomeScreenData.swift
//  SDO
//
//  Created by Joel Kingsley on 26/08/2022.
//

import Foundation

struct HomeScreenData {
    struct HomeVideo: Identifiable, ThumbnailableVideo {
        let videoId: String
        let title: String
        let channelId: String
        let channelName: String
        let datePublished: Date
        let speakerName: String
        let thumbnailURL: URL
        
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
    }
    
    let continueWatchingVideos: [HomeVideo]
    let userListVideos: [HomeVideo]
    let newReleasesVideos: [HomeVideo]
}
