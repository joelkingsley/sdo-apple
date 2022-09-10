//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var homeTabViewModel = HomeTabViewModel()
    
    var body: some View {
        if let homeScreenData = homeTabViewModel.homeScreenData {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        switch homeScreenData {
                        case let .success(data):
                            if !data.continueWatchingVideos.isEmpty {
                                ContinueWatchingRow(videos: data.continueWatchingVideos)
                            }
                            if !data.userListVideos.isEmpty {
                                YourListRow(videos: data.userListVideos)
                            }
                            if !data.newReleasesVideos.isEmpty {
                                NewReleasesRow(videos: data.newReleasesVideos)
                            }
                        case let .failure(error):
                            CustomErrorView(
                                error: error,
                                authViewModel: authViewModel
                            )
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.horizontal)
            .navigationBarTitle(Text("homeScreenTitle", comment: "Label: Navigation bar title of Home Screen"))
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    homeTabViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
