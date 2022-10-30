//
//  SearchResultRow.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 30/10/2022.
//

import SwiftUI

struct SearchResultRow: View {
    let video: SearchResultData.Video
    @State var thumbnailWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            VideoThumbnail(video: video, style: .xsmall, thumbnailWidth: $thumbnailWidth)
                .frame(width: thumbnailWidth)
            VStack {
                HStack {
                    Text(video.title)
                    Spacer()
                }
                HStack {
                    Text(video.videoType.localizedString())
                        .font(.sdoCaption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Spacer()
                }
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
            }
            Spacer()
                .frame(width: 20)
            
        }
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(video: SearchResultData.Video(
            videoId: exampleVideo1.videoId,
            title: exampleVideo1.title,
            channelId: exampleVideo1.channelId,
            channelName: exampleVideo1.channelName,
            datePublished: exampleVideo1.datePublished,
            speakerName: exampleVideo1.speakerName,
            videoType: .documentary,
            thumbnailURL: exampleVideo1.thumbnailURL
        ))
    }
}
