//
//  HomeScreenData.swift
//  SDO
//
//  Created by Joel Kingsley on 26/08/2022.
//

import Foundation

struct HomeScreenData {
    struct HomeVideo: ThumbnailableVideo, Identifiable {
        var id: UUID {
            return UUID(uuidString: videoId) ?? UUID()
        }
        let videoId: String
        let title: String
        let channelId: String
        let channelName: String
        let thumbnailURL: URL
        let datePublished: Date
        let views: Int
    }
    
    let continueWatchingVideos: [HomeVideo]
    let userListVideos: [HomeVideo]
    let newReleasesVideos: [HomeVideo]
}
