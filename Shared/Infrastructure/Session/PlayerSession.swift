//
//  PlayerSession.swift
//  SDO
//
//  Created by Joel Kingsley on 25/10/2022.
//

import Foundation
import SwiftUI
import AVKit
import Combine

class PlayerSession: ObservableObject {
    @ObservedObject public static var shared = PlayerSession.init()
    
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        $isPlaying.sink { isShowing in
            AppLogger.debug("isPlaying=\(isShowing)")
        }.store(in: &cancellables)
        
        $player.sink { player in
            AppLogger.debug("player=\(player)")
        }.store(in: &cancellables)
    }
    
    @Published public var player = AVPlayer()
    @Published public var videoIdOfCurrentlyPlayingItem: String?
    @Published public var isPlaying = false
    @Published public var isPiP = false
    public weak var playerViewControllerReference: AVPlayerViewController?
}
