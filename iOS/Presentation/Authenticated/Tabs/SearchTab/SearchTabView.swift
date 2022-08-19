//
//  SearchTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 28/07/2022.
//

import SwiftUI

struct SearchTabView: View {
    @State private var searchText = ""
    @StateObject var searchTabViewModel = SearchTabViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("searchBrowseLabel")
                        .font(.sdoTitle2)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                VStack {
                    HStack {
                        TileButton(text: "searchSermonsButtonLabel", imageName: "sermons") {

                        }
                        Spacer()
                        TileButton(text: "searchDocumentariesButtonLabel", imageName: "documentaries") {

                        }
                    }
                    .padding(.horizontal, 10)
                    HStack {
                        TileButton(text: "searchShortsButtonLabel", imageName: "shorts") {

                        }
                        Spacer()
                        TileButton(text: "searchMusicButtonLabel", imageName: "music") {

                        }
                    }
                    .padding(.horizontal, 10)
                    TileButton(text: "searchChannelsButtonLabel", imageName: "channels") {
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
                .frame(maxWidth: 600)
                
                HStack {
                    Text("searchLanguagesLabel")
                        .font(.sdoTitle2)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                VStack {
                    ForEach(searchTabViewModel.languages, id: \.1) { language in
                        Button {
                            
                        } label: {
                            VStack {
                                HStack {
                                    Text(language.0)
                                        .padding(.horizontal, 5)
                                        .font(.sdoBody)
                                    Text(language.1)
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
                
                Spacer()
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "searchBarPlaceholderLabel")
            .navigationBarTitle(Text("searchScreenTitle", comment: "Label: Navigation bar title of Search Screen"))
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}
