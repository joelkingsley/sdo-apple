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
    
    var appCustomToolbar: some View {
        HStack {
            Image(
                systemName: "globe.asia.australia.fill"
            )
            .foregroundColor(.accentColor)
            .font(.system(size: 25))
            
            VStack {
                HStack {
                    Text(verbatim: "Sound Doctrine")
                        .font(
                            .custom(
                                "Copperplate",
                                fixedSize: 25
                            )
                            .weight(.heavy)
                        )
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                
                HStack {
                    Text(verbatim: "Online")
                        .font(
                            .custom(
                                "Copperplate",
                                fixedSize: 15
                            )
                            .weight(.heavy)
                        )
                        .foregroundColor(.accentColor)
                    Spacer()
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 20)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                appCustomToolbar
                
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
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
