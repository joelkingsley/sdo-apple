//
//  VideoPlayerView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 17/10/2022.
//

import SwiftUI
import AVFoundation
import AVKit

protocol PlayableVideo {
    var title: String { get }
    var speakerName: String { get }
    var channelName: String { get }
    var datePublished: Date { get }
}

struct VideoPlayerView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @ObservedObject var videoPlayerViewModel = VideoPlayerViewModel()
    let video: PlayableVideo
    
    init(video: PlayableVideo) {
        self.video = video
    }
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                
                SDOVideoPlayer(player: videoPlayerViewModel.player)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .frame(maxHeight: .infinity)
            }
            .frame(minHeight: 140, maxHeight: 350)
            
            Spacer()
                .frame(height: 10)
            
            ScrollView {
                Text(video.title)
                    .font(.sdoTitle3)
                
                Text("\(video.speakerName) · \(video.channelName)")
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Text(video.datePublished.formatted(date: .abbreviated, time: .omitted))
                    .font(.sdoCaption)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Spacer()
                    .frame(height: 20)
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    VStack {
                        Image(systemName: "hand.thumbsup")
                        Text("videoPlayerViewILikeThisLabel")
                    }
                    .padding(.leading)
                    .padding(.top)
                    .padding(.bottom)
                    
                    VStack {
                        Image(systemName: "hand.thumbsdown")
                        Text("videoPlayerViewNotForMeLabel")
                    }
                    .padding(.leading)
                    .padding(.top)
                    .padding(.bottom)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            videoPlayerViewModel.onBackPressed()
            self.mode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrow.left")
        })
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(
            video: exampleVideo1
        )
    }
}
