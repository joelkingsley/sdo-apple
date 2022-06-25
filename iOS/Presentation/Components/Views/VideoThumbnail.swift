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
        KFImage(video.thumbnailURL)
            .resizable()
            .scaledToFill()
    }
}

struct VideoThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumbnail(
            video: VideoData(
                id: 1,
                name: "Once Saved Always Saved",
                thumbnailURL: URL(
                    string: "https://m.media-amazon.com/images/M/MV5BNDI5ZjI3YjEtNDZmNS00OTU1LWI4NDEtYThiMDJlMzhlYjI4XkEyXkFqcGdeQXVyODY0NzcxNw@@._V1_FMjpg_UX1000_.jpg"
                )!,
                categories: []
            )
        )
    }
}
