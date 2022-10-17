//
//  SearchResultView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 01/10/2022.
//

import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var searchResultViewModel: SearchResultViewModel
    @State var thumbnailWidth: CGFloat = 0
    
    init(
        ofItemType itemType: SearchResultItemType,
        searchText: String? = nil
    ) {
        self.searchResultViewModel = SearchResultViewModel(searchResultItemType: itemType, searchText: searchText)
    }
    
    var body: some View {
        if let error = searchResultViewModel.errorOccurred {
            CustomErrorView(
                error: error,
                authViewModel: authViewModel
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("searchResultsScreenNavigationTitle")
        } else if searchResultViewModel.isPageLoaded {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    Picker("SearchResultItemTypes", selection: $searchResultViewModel.selectedSearchResultItemType) {
                        ForEach(SearchResultItemType.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom)
                    .padding(.horizontal)
                    
                    InfiniteList(
                        data: $searchResultViewModel.searchResultVideos,
                        isLoading: Binding.constant(false)
                    ) {
                        
                    } content: { video in
                        HStack {
                            VideoThumbnail(video: video, style: .xsmall, thumbnailWidth: $thumbnailWidth)
                                .frame(width: thumbnailWidth)
                            VStack {
                                HStack {
                                    Text(video.title)
                                    Spacer()
                                }
                                HStack {
                                    Text(video.videoType.localizedString())
                                        .font(.sdoCaption)
                                        .foregroundColor(Color(uiColor: .secondaryLabel))
                                    Spacer()
                                }
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                            }
                            Spacer()
                                .frame(width: 20)
                            
                        }
                    }
                    .padding(.leading, 20)
                }
                .searchable(
                    text: $searchResultViewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "searchResultsSearchLabel"
                )
                .textInputAutocapitalization(.never)
                .onSubmit(of: .search) {
                    searchResultViewModel.onSearchTextSubmitted()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("searchResultsScreenNavigationTitle")
            }
        } else {
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("searchResultsScreenNavigationTitle")
                .onAppear {
                    searchResultViewModel.onLoaded()
                }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(ofItemType: .all)
    }
}
