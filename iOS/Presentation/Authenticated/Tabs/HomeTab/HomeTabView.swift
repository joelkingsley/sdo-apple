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
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ContinueWatchingRow(videos: [exampleVideo1, exampleVideo2])
                    YourListRow(videos: [exampleVideo1, exampleVideo2])
                    NewReleasesRow(videos: [exampleVideo1, exampleVideo2])
                }
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .navigationBarTitle(Text("homeScreenTitle", comment: "Label: Navigation bar title of Home Screen"))
        .onAppear {
            Task {
                await homeTabViewModel.onLoaded()
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(authViewModel: AuthenticationViewModel())
    }
}
