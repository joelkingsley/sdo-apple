//
//  HomeTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct HomeTabView: View {
    let viewModel: HomeTabViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(viewModel.allCategories, id: \.self) { category in
                    VStack {
                        HStack {
                            Text(category)
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                let videos = [
                                    exampleVideo1,
                                    exampleVideo2
                                ]
                                ForEach(videos) { video in
                                    VideoThumbnail(video: video)
                                        .frame(width: 250, height: 150)
                                        .padding(.trailing, 20)
                                }
                            }
                            .padding(.leading, 20)
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(
                        systemName: "globe.asia.australia.fill"
                    )
                    .foregroundColor(.accentColor)
                    .font(.system(size: 25))
                    
                    VStack {
                        Text(verbatim: "Sound Doctrine")
                            .font(
                                .custom(
                                    "Copperplate",
                                    fixedSize: 25
                                )
                                .weight(.heavy)
                            )
                            .foregroundColor(.accentColor)
                        
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
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 20)
            }
        }
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
