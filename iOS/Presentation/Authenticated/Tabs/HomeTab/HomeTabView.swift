//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject var homeTabViewModel: HomeTabViewModel
    
    init(authViewModel: AuthenticationViewModel) {
        self.homeTabViewModel = HomeTabViewModel(authViewModel: authViewModel)
        self.homeTabViewModel.onLoaded()
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    if let homeScreenData = homeTabViewModel.homeScreenData {
                        if !homeScreenData.continueWatchingVideos.isEmpty {
                            ContinueWatchingRow(videos: homeScreenData.continueWatchingVideos)
                        }
                        if !homeScreenData.userListVideos.isEmpty {
                            YourListRow(videos: homeScreenData.userListVideos)
                        }
                        if !homeScreenData.newReleasesVideos.isEmpty {
                            NewReleasesRow(videos: homeScreenData.newReleasesVideos)
                        }
                    } else {
                        // TODO: Display error view here
                        Text("Error View")
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .navigationBarTitle(Text("homeScreenTitle", comment: "Label: Navigation bar title of Home Screen"))
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(authViewModel: AuthenticationViewModel())
    }
}
