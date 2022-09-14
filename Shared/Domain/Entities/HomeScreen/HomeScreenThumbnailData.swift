//
//  HomeScreenThumbnailData.swift
//  SDO
//
//  Created by Joel Kingsley on 11/09/2022.
//

import Foundation

struct HomeScreenThumbnailData {
    struct HomeVideo {
        struct HomeVideoThumbnailData {
            let videoId: String
            let thumbnailUrl: URL
        }
        
        let thumbnailData: HomeVideoThumbnailData
    }
    
    let continueWatchingVideos: [HomeVideo]
    let userListVideos: [HomeVideo]
    let newReleasesVideos: [HomeVideo]
}
