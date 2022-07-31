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
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(homeTabViewModel.allCategories, id: \.self) { category in
                    VStack {
                        HStack {
                            Text(category)
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        .padding(.leading, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(homeTabViewModel.videos[category] ?? []) { video in
                                    VideoThumbnail(video: exampleVideo1, style: .medium)
                                }
                            }
                            .padding(.leading, 20)
                        }
                    }
                    .padding(.top, 10)
                }
                
                Button("Sign Out") {
                    authViewModel.signOut()
                }
            }
        }
        .navigationTitle("homeScreenTitle")
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
