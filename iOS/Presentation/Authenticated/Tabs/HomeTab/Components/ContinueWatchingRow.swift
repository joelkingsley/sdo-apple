//
//  ContinueWatchingRow.swift
//  SDO
//
//  Created by Joel Kingsley on 19/08/2022.
//

import SwiftUI

struct ContinueWatchingRow: View {
    let videos: [VideoData]
    let videoThumbnailsRowViewModel = VideoThumbnailsRowViewModel()
    
    @State var thumbnailWidth: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(uiColor: .systemBackground), Color(uiColor: .systemGray).opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                HStack {
                    Text("homeContinueWatchingLabel")
                        .font(.sdoTitle2)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(videos) { video in
                            VStack {
                                VideoThumbnail(video: video, style: .large, thumbnailWidth: $thumbnailWidth)
                                Group {
                                    HStack {
                                        Text(video.videoTitle)
                                            .font(.sdoCallout)
                                            .foregroundColor(Color(uiColor:UIColor.label))
                                        Spacer()
                                    }
                                    HStack {
                                        Text(videoThumbnailsRowViewModel.getThumbnailDescription(ofVideo: video))
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                            .font(.sdoFootnote)
                                            .foregroundColor(Color(uiColor:UIColor.secondaryLabel))
                                        Spacer()
                                    }
                                }
                                .frame(width: thumbnailWidth)
                                Spacer()
                                    .frame(height: 20)
                            }
                        }
                        Spacer()
                            .frame(width: 20)
                    }
                    .padding(.leading, 20)
                }
            }
        }
    }
}

struct ContinueWatchingRow_Previews: PreviewProvider {
    static var previews: some View {
        ContinueWatchingRow(videos: [exampleVideo1, exampleVideo2])
    }
}
