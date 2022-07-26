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
                
                TopVideoPreview(video: exampleVideo1)
                    .padding(.bottom, 30)
                
                ForEach(homeTabViewModel.allCategories, id: \.self) { category in
                    VStack {
                        HStack {
                            Text(category)
                                .font(
                                    .custom(
                                        "Copperplate",
                                        size: 20)
                                )
                                .bold()
                                .foregroundColor(.accentColor)
                            Spacer()
                        }
                        .padding(.leading, 20)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(homeTabViewModel.videos[category] ?? []) { video in
                                    VideoThumbnail(video: exampleVideo1)
                                }
                            }
                            .padding(.leading, 20)
                        }
                    }
                }
                
                Button("Sign Out") {
                    authViewModel.signOut()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                appCustomToolbar
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
