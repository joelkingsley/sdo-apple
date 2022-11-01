//
//  ChannelDetailView.swift
//  SDO
//
//  Created by Joel Kingsley on 01/11/2022.
//

import SwiftUI

struct ChannelDetailView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var channelDetailViewModel: ChannelDetailViewModel
    
    init(channelId: String?) {
        self.channelDetailViewModel = ChannelDetailViewModel(channelId: channelId)
    }
    
    var body: some View {
        if channelDetailViewModel.channelId == nil {
            CustomErrorView(
                error: BusinessErrors.clientError(),
                authViewModel: authViewModel
            )
        } else if let channelDetailData = channelDetailViewModel.channelDetailData {
            switch channelDetailData {
            case let .success(data):
                VStack {
                    Text(data.channelName)
                        .font(.sdoTitle)
                    HStack {
                        Text("\(data.channelType.localizedString()) · \(data.videosInChannel.count) video(s)")
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(data.videosInChannel, id: \.id) { video in
                                VideoInChannelRow(video: video)
                            }
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
                    channelDetailViewModel.onLoaded()
                }
        }
    }
}

struct ChannelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelDetailView(channelId: "")
    }
}
