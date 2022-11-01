//
//  VideoInChannelRow.swift
//  SDO
//
//  Created by Joel Kingsley on 02/11/2022.
//

import SwiftUI

struct VideoInChannelRow: View {
    let video: ChannelDetailData.Video
    @State var thumbnailWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
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

struct VideoInChannelRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoInChannelRow(
            video: ChannelDetailData.Video(
                videoId: exampleVideoDetail1.videoId,
                title: exampleVideoDetail1.title,
                videoType: .documentary,
                channelName: exampleVideoDetail1.channelName,
                speaker: ChannelDetailData.Video.Speaker(
                    speakerId: "",
                    speakerName: exampleVideoDetail1.speakerName
                ),
                language: ChannelDetailData.Video.Language(
                    languageCode: "en",
                    sourceCountryFlag: "🇬🇧"
                ),
                thumbnailUrl: exampleVideoDetail1.thumbnailURL,
                description: exampleVideoDetail1.description,
                datePublished: exampleVideoDetail1.datePublished
            )
        )
    }
}
