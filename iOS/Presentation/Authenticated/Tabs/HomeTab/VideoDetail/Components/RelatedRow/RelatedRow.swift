//
//  RelatedRow.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import SwiftUI

struct RelatedRow: View {
    let videos: [VideoDetailData.RelatedVideo]
    @State var thumbnailWidth: CGFloat = 0
    let videoThumbnailsRowViewModel = VideoThumbnailsRowViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("videoDetailRelatedLabel")
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
                                        .lineLimit(3)
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

struct RelatedRow_Previews: PreviewProvider {
    static var previews: some View {
        RelatedRow(videos: exampleVideoDetail1.relatedVideos)
    }
}
