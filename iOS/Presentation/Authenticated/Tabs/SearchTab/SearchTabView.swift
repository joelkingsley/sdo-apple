//
//  SearchTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 28/07/2022.
//

import SwiftUI

struct SearchTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Binding var tabSelection: Tab
    
    @State private var searchText = ""
    @StateObject var searchTabViewModel = SearchTabViewModel()
    @State private var showAllResultView = false
    @State private var showSermonsResultView = false
    @State private var showDocumentariesResultView = false
    @State private var showShortsResultView = false
    @State private var showMusicResultView = false
    
    var body: some View {
        ScrollView {
            NavigationLink(
                destination: SearchResultView(ofItemType: .all, searchText: searchText),
                isActive: $showAllResultView) {
                    EmptyView()
                }
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
                        NavigationLink(destination: SearchResultView(ofItemType: .sermons), isActive: $showSermonsResultView) {
                            TileButton(text: "searchSermonsButtonLabel", imageName: "sermons") {
                                showSermonsResultView = true
                            }
                        }
                        Spacer()
                        NavigationLink(destination: SearchResultView(ofItemType: .documentaries), isActive: $showDocumentariesResultView) {
                            TileButton(text: "searchDocumentariesButtonLabel", imageName: "documentaries") {
                                showDocumentariesResultView = true
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    HStack {
                        NavigationLink(destination: SearchResultView(ofItemType: .shorts), isActive: $showShortsResultView) {
                            TileButton(text: "searchShortsButtonLabel", imageName: "shorts") {
                                showShortsResultView = true
                            }
                        }
                        Spacer()
                        NavigationLink(destination: SearchResultView(ofItemType: .music), isActive: $showMusicResultView) {
                            TileButton(text: "searchMusicButtonLabel", imageName: "music") {
                                showMusicResultView = true
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    TileButton(text: "searchChannelsButtonLabel", imageName: "channels") {
                        tabSelection = .Channels
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
            .onSubmit(of: .search) {
                showAllResultView = true
            }
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView(tabSelection: Binding.constant(.Search))
    }
}
