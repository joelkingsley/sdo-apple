//
//  VideoThumbnail.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 25/06/2022.
//

import SwiftUI
import Kingfisher

struct VideoThumbnail: View {
    var video: VideoData
    
    var body: some View {
        VStack {
            KFImage(video.thumbnailURL)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text(video.name)
                    .font(.caption)
                    .foregroundColor(.black)
                Spacer()
            }
            HStack {
                Text("\(video.channel)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .frame(
            width: 250,
            height: 200
        )
    }
}

struct VideoThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnail(
            video: exampleVideo1
        )
    }
}
