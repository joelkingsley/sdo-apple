//
//  HomeScreenInfoData.swift
//  SDO
//
//  Created by Joel Kingsley on 11/09/2022.
//

import Foundation

struct HomeScreenInfoData {
    struct HomeVideo {
        struct HomeVideoInfoData {
            let videoId: String
            let title: String
            let channelId: String
            let channelName: String
            let datePublished: Date
            let speakerName: String
        }
        
        let infoData: HomeVideoInfoData
    }
    
    let continueWatchingVideos: [HomeVideo]
    let userListVideos: [HomeVideo]
    let newReleasesVideos: [HomeVideo]
}
