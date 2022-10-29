//
//  VideoDetailView.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import SwiftUI

struct VideoDetailView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var videoDetailViewModel = VideoDetailViewModel()
    
    init(videoId: String, channelId: String) {
        self.videoDetailViewModel.videoId = videoId
        self.videoDetailViewModel.channelId = channelId
    }

    var body: some View {
        if let videoDetailData = videoDetailViewModel.videoDetailData {
            switch videoDetailData {
            case let .success(data):
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        TopVideoPreview(video: data)

                        Divider()
                            .padding(.horizontal, 20)

                        RelatedRow(videos: data.infoData.relatedVideos)

                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.horizontal)
                .navigationTitle(data.infoData.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button {
                                // Share video
                                // TODO: To be integrated
                            } label: {
                                Image(systemName: "arrowshape.turn.up.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            .foregroundColor(.accentColor.opacity(0.8))
                        }
                    }
                }
            case let .failure(error):
                CustomErrorView(
                    error: error,
                    authViewModel: authViewModel
                )
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    videoDetailViewModel.onLoaded()
                }
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(videoId: "", channelId: "")
    }
}
