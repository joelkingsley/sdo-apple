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
        PlayerSession.shared.player
    }
    
    var isPiP: Bool {
        PlayerSession.shared.isPiP
    }
    
    func onBackPressed() {
        if !isPiP && !player.isExternalPlaybackActive {
            player.pause()
        }
    }
}
