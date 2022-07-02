//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    let viewModel: HomeTabViewModel
    
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
                
                ForEach(viewModel.allCategories, id: \.self) { category in
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
                                let videos = [
                                    exampleVideo1,
                                    exampleVideo2
                                ]
                                ForEach(videos) { video in
                                    VideoThumbnail(video: video)
                                }
                            }
                            .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(
            viewModel: HomeTabViewModel(
                videos: [
                    "Your List": [exampleVideo1, exampleVideo2],
                    "Popular on SDO": [exampleVideo1, exampleVideo2, exampleVideo1, exampleVideo2],
                    "Continue Watching": [exampleVideo1, exampleVideo2],
                    "New Releases": [exampleVideo1, exampleVideo2],
                    "Short Clips": [exampleVideo2]
                ]
            )
        )
    }
}
