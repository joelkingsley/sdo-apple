//
//  VideoPlayerViewModel.swift
//  SDO
//
//  Created by Joel Kingsley on 03/09/2022.
//

import Foundation
import AVFoundation
import AVKit

class VideoPlayerViewModel: ObservableObject {
    init() {
    }
    
    var player: AVPlayer {
        PlayerState.shared.player
    }
    
    func onBackPressed() {
        PlayerState.shared.stopVideoIfPlayingAsEmbedded()
    }
}
