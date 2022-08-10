//
//  VideoThumbnail.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI
import Kingfisher

enum VideoThumbnailStyle {
    case large
    case medium
    case small
}

struct VideoThumbnail: View {
    let video: VideoData
    
    let style: VideoThumbnailStyle
    
    private var imageWidth: CGFloat {
        switch style {
        case .large:
            return 350
        case .medium:
            return 250
        case .small:
            return 150
        }
    }
    
    private var imageHeight: CGFloat {
        switch style {
        case .large:
            return 200
        case .medium:
            return 150
        case .small:
            return 100
        }
    }
    
    var body: some View {
        VStack {
            KFImage(video.thumbnailURL)
                .resizable()
                .scaledToFill()
                .frame(
                    width: imageWidth,
                    height: imageHeight
                )
                .cornerRadius(15)
            Group {
                HStack {
                    Text(video.name)
                        .font(.callout)
                        .foregroundColor(Color(uiColor:UIColor.label))
                    Spacer()
                }
                HStack {
                    Text("\(video.channel)")
                        .font(.footnote)
                        .foregroundColor(Color(uiColor:UIColor.secondaryLabel))
                    Spacer()
                }
            }
            .frame(width: imageWidth, height: 15, alignment: .leading)
        }
    }
}

struct VideoThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnail(
            video: exampleVideo1,
            style: .large
        )
    }
}
