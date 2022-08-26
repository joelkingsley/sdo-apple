//
//  VideoThumbnailsRowViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 19/08/2022.
//

import SwiftUI

struct VideoThumbnailsRowViewModel {
    func getThumbnailDescription(ofVideo video: ThumbnailableVideo) -> String {
        var description = ""
        description.append(video.channelName)
        description.append(" ")
        description.append("·")
        description.append(" ")
        description.append(video.views.formatted(.number))
        description.append(" ")
        if video.views == 1 {
            description.append(String(localized: "videoDetailViewLabel"))
        } else {
            description.append(String(localized: "videoDetailViewsLabel"))
        }
        description.append(" ")
        description.append("·")
        description.append(" ")
        
        let timeInterval = Date().timeIntervalSince(video.datePublished)
        if !timeInterval.isLess(than: 0)
        {
            description.append(
                String(localized: "videoDetailPublishedDateLabel \(timeInterval.formattedByLength())")
            )
        } else {
            description.append(String(localized: "videoDetailScheduledLabel"))
        }
        
        description.append("\n")
        
        return description
    }
}
