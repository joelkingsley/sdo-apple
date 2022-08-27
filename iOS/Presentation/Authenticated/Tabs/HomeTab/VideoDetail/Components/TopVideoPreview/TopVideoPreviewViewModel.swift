//
//  TopVideoPreviewViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation
import SwiftUI

struct TopVideoPreviewViewModel {
    let video: TopPreviewableVideo
    
    init(video: TopPreviewableVideo) {
        self.video = video
    }
    
    var contentHeight: CGFloat {
        if video.canUserWatch {
            return 180
        } else {
            if video.subscriptionForWatching != nil {
                return 300
            } else {
                return 240
            }
        }
    }
}
