//
//  SDOVideoPlayer.swift
//  SDO
//
//  Created by Joel Kingsley on 31/08/2022.
//

import SwiftUI
import AVFoundation
import AVKit

struct SDOVideoPlayer: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    public typealias TransitionCompletion = (AVPlayerViewController, UIViewControllerTransitionCoordinator) -> Void
    
    let player: AVPlayer
    let willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    let willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion?
    
    public init(
        player: AVPlayer,
        willBeginFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil,
        willEndFullScreenPresentationWithAnimationCoordinator: TransitionCompletion? = nil
    ) {
        self.player = player
        self.willBeginFullScreenPresentationWithAnimationCoordinator = willBeginFullScreenPresentationWithAnimationCoordinator
        self.willEndFullScreenPresentationWithAnimationCoordinator = willEndFullScreenPresentationWithAnimationCoordinator
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        controller.delegate = context.coordinator
        controller.modalPresentationStyle = .overFullScreen
        controller.entersFullScreenWhenPlaybackBegins = true
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.showsPlaybackControls = true
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public final class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        var parent: SDOVideoPlayer

        init(_ parent: SDOVideoPlayer) {
            self.parent = parent
        }

        public func playerViewController(
            _ playerViewController: AVPlayerViewController,
            willBeginFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator
        ) {
            parent.willBeginFullScreenPresentationWithAnimationCoordinator?(playerViewController, coordinator)
        }

        public func playerViewController(
            _ playerViewController: AVPlayerViewController,
            willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator
        ) {
            parent.willEndFullScreenPresentationWithAnimationCoordinator?(playerViewController, coordinator)
        }
    }
}
