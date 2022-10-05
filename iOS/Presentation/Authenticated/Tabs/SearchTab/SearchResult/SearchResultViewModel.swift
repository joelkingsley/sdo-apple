//
//  SearchResultViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 01/10/2022.
//

import SwiftUI

@MainActor
class SearchResultViewModel: ObservableObject {
    private let getVideosOfSearchParametersUseCase = GetVideosOfSearchParametersUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    @Published var searchText: String
    @Published var searchResultData: Result<SearchResultData, BusinessError>?
    @Published var searchResultItemType: SearchResultItemType
    
    init(searchResultItemType: SearchResultItemType, searchText: String?) {
        self.searchText = searchText ?? ""
        self.searchResultItemType = searchResultItemType
    }
    
    func onLoaded() {
        Task {
            await getVideosForSearchParameters()
        }
    }
    
    private func getVideosForSearchParameters() async {
        switch await getVideosOfSearchParametersUseCase.execute(
            searchResultInputData: SearchResultInputData(
                videoType: VideoType(searchResultItemType: searchResultItemType), searchText: searchText)) {
        case let .success(data):
            AppLogger.debug(data)
            searchResultData = .success(data)
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            searchResultData = .failure(error)
        }
    }
}

enum SearchResultItemType: LocalizedStringKey, CaseIterable {
    case all = "searchResultsItemTypeAll"
    case sermons = "searchResultsItemTypeSermons"
    case documentaries = "searchResultsItemTypeDocumentaries"
    case shorts = "searchResultsItemTypeShorts"
    case music = "searchResultsItemTypeMusic"
}

extension VideoType {
    init?(searchResultItemType: SearchResultItemType) {
        switch searchResultItemType {
        case .all:
            self.init(rawValue: "")
        case .sermons:
            self = .sermon
        case .documentaries:
            self = .documentary
        case .shorts:
            self = .short
        case .music:
            self = .music
        }
    }
}
