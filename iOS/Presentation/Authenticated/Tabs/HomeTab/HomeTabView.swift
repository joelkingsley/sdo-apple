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
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
