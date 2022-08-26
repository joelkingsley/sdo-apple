//
//  NewReleasesRow.swift
//  SDO
//
//  Created by Joel Kingsley on 19/08/2022.
//

import SwiftUI

struct NewReleasesRow: View {
    let videos: [HomeScreenData.HomeVideo]
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
                    Text("homeNewReleasesLabel")
                        .font(.sdoTitle2)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(videos) { video in
                            VStack {
                                VideoThumbnail(video: video, style: .small, thumbnailWidth: $thumbnailWidth)
                                Group {
                                    HStack {
                                        Text(video.title)
                                            .font(.sdoCallout)
                                            .lineLimit(1)
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

struct NewReleasesRow_Previews: PreviewProvider {
    static var previews: some View {
        NewReleasesRow(videos: [
            exampleVideo1, exampleVideo2
        ])
    }
}
