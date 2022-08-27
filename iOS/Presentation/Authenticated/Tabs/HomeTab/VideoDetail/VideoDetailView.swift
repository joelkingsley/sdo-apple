//
//  VideoDetailView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import SwiftUI

struct VideoDetailView: View {
    let videoDetail: VideoDetailData
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TopVideoPreview(video: videoDetail)
                
                Divider()
                    .padding(.horizontal, 20)
                
                RelatedRow(videos: videoDetail.relatedVideos)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .navigationTitle(exampleVideoDetail1.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Button {
                        // Add to User List
                        // TODO: To be integrated
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.accentColor.opacity(0.8))
                    
                    Button {
                        // Share video
                        // TODO: To be integrated
                    } label: {
                        Image(systemName: "square.and.arrow.up.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.accentColor.opacity(0.8))
                }
            }
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(videoDetail: exampleVideoDetail1)
    }
}
