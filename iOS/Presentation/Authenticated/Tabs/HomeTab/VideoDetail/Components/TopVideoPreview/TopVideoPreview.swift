//
//  TopVideoPreview.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/06/2022.
//

import SwiftUI
import Kingfisher
import AVKit

protocol TopPreviewableVideo {
    var title: String { get }
    var localizedType: String { get }
    var thumbnailURL: URL { get }
    var datePublished: Date { get }
    var description: String { get }
    var speakerName: String { get }
    var canUserWatch: Bool { get }
    var subscriptionForWatching: SubscriptionData? { get }
    var allAccessSubscription: SubscriptionData { get }
    var signedUrl: URL? { get }
}

struct TopVideoPreview: View {
    let video: TopPreviewableVideo
    let topVideoPreviewViewModel: TopVideoPreviewViewModel
    let videoPlayerViewModel: VideoPlayerViewModel
    
    @State var isShowingPlayer: Bool = false
    
    init(video: TopPreviewableVideo) {
        self.video = video
        self.topVideoPreviewViewModel = TopVideoPreviewViewModel(video: video)
        self.videoPlayerViewModel = VideoPlayerViewModel(url: video.signedUrl)
    }
    
    var body: some View {
        ZStack {
            VStack {
                KFImage(video.thumbnailURL)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .overlay(content: {
                        LinearGradient(
                            colors: [
                                Color(uiColor: UIColor.systemBackground).opacity(0.0),
                                Color(uiColor: UIColor.systemBackground).opacity(0.10),
                                Color(uiColor: UIColor.systemBackground).opacity(0.99)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .padding(.top, -150)
                    })
                Spacer()
                    .frame(height: topVideoPreviewViewModel.contentHeight)
            }

            VStack {
                Spacer()
                
                Group {
                    Text(video.title)
                        .font(.sdoTitle2)
                        .bold()
                        .foregroundColor(Color(uiColor: .label))
                    
                    Text(video.localizedType)
                        .font(.sdoCallout)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    
                    Text(video.datePublished.formatted(date: .abbreviated, time: .omitted))
                        .font(.sdoCaption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    
                    Text(video.speakerName)
                        .font(.sdoCaption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                
                if video.canUserWatch {
                    HStack {
                        Spacer()

                        NavigationLink(isActive: $isShowingPlayer) {
                            if let player = videoPlayerViewModel.player {
                                SDOVideoPlayer(
                                    player: player,
                                    willBeginFullScreenPresentationWithAnimationCoordinator: videoPlayerViewModel
                                        .willBeginFullScreenPresentationHandler,
                                    willEndFullScreenPresentationWithAnimationCoordinator: videoPlayerViewModel
                                        .willEndFullScreenPresentationHandler
                                )
                                .aspectRatio(16/9, contentMode: .fit)
                                .onDisappear {
                                    videoPlayerViewModel.resetPlayer()
                                }
                            } else {
                                Text("Error occurred")
                            }
                        } label: {
                            EmptyView()
                        }
                        ActionButton(
                            imageName: "play.fill",
                            customFont: .sdoTitle2, text: "videoDetailPlayButtonLabel") {
                            isShowingPlayer = true
                        }
                        .frame(width: 250)

                        Spacer()
                    }
                } else {
                    if let subscription = video.subscriptionForWatching {
                        HStack {
                            Spacer()
                            VStack {
                                ActionButton(customFont: .sdoCallout, text: subscription.localizedSubscribeButtonText) {
                                    // TODO: Subscribe user to given subscription
                                }
                                .frame(width: 250)
                                Text(subscription.localizedSubscriptionCostText)
                                    .font(.sdoCaption2)
                            }
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            ActionButton(customFont: .sdoCallout, text: video.allAccessSubscription.localizedSubscribeButtonText) {
                                // TODO: Subscribe user to all access subscription
                            }
                            .frame(width: 250)
                            Text(video.allAccessSubscription.localizedSubscriptionCostText)
                                .font(.sdoCaption2)
                        }
                        Spacer()
                    }
                }
                
                Text(video.description)
                    .lineLimit(2)
                    .foregroundColor(Color(uiColor: .label))
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .truncationMode(.tail)
                
                HStack {
                    Spacer()
                    Button {
                        // TODO: Show dismissable sheet with full description
                    } label: {
                        Text("videoDetailMoreTextLabel")
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
    }
}

struct TopVideoPreview_Previews: PreviewProvider {
    static var previews: some View {
        TopVideoPreview(video: exampleVideoDetail1)
    }
}
