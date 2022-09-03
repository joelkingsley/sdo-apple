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
    let url: URL?
    var player: AVPlayer?
    
    init(url: URL?) {
        self.url = url
        guard let url = url else {
            self.player = nil
            return
        }
        self.player = AVPlayer(url: url)
    }
    
    /// Resets the player object
    func resetPlayer() {
        player?.seek(to: .zero)
        player?.pause()
    }
    
    /// Will begin full screen presentation handler
    func willBeginFullScreenPresentationHandler(
        controller: AVPlayerViewController,
        coordinator: UIViewControllerTransitionCoordinator
    ) {
        let isPlaying = controller.player?.isPlaying ?? false
        coordinator.animate(alongsideTransition: nil) { _ in
            if isPlaying {
                controller.player?.play()
            }
        }
    }
    
    /// Will end full screen presentation handler
    func willEndFullScreenPresentationHandler(
        controller: AVPlayerViewController,
        coordinator: UIViewControllerTransitionCoordinator
    ) {
        let isPlaying = controller.player?.isPlaying ?? false
        coordinator.animate(alongsideTransition: nil) { _ in
            if isPlaying {
                controller.player?.play()
            }
        }
    }
}
