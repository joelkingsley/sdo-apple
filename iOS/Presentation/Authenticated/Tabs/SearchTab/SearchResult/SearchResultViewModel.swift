//
//  SearchResultViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 01/10/2022.
//

import SwiftUI
import Combine

@MainActor
class SearchResultViewModel: ObservableObject {
    private let getVideosOfSearchParametersUseCase = GetVideosOfSearchParametersUseCase(
        videoRepository: HasuraVideoRepository(
            graphQLService: HasuraGraphQLService()))
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Search parameters
    
    @Published var searchText: String
    @Published var selectedSearchResultItemType: SearchResultItemType
    private let pageLimit = 10
    
    // MARK: - Api data and view state
    
    @Published var isPageLoaded: Bool = false
    @Published var searchResultVideos: [SearchResultData.Video] = []
    @Published var totalAvailableVideosForSearchResult: Int = 0
    @Published var errorOccurred: BusinessError? = nil
    @Published var highestLoadedPage: Int = -1
    var totalPagesForSearchResult: Int {
        if totalAvailableVideosForSearchResult%pageLimit != 0 {
            return (totalAvailableVideosForSearchResult/pageLimit) + 1
        } else {
            return totalAvailableVideosForSearchResult/pageLimit
        }
    }
    
    // MARK: - Lifecycle
    
    init(searchResultItemType: SearchResultItemType, searchText: String?) {
        self.selectedSearchResultItemType = searchResultItemType
        self.searchText = searchText ?? ""
    }
    
    // MARK: - Methods
    
    func onLoaded() {
        self.$selectedSearchResultItemType.sink { [weak self] searchResultItemType in
            guard let self = self else { return }
            self.isPageLoaded = false
            Task {
                await self.loadInitialVideos(ofItemType: searchResultItemType)
            }
        }.store(in: &cancellables)
    }
    
    func onSearchTextSubmitted() {
        isPageLoaded = false
        Task {
            await self.loadInitialVideos(ofItemType: selectedSearchResultItemType)
        }
    }
    
    func checkAndLoadMoreVideos() {
    }
    
    private func resetSearchResults() {
        self.searchResultVideos = []
        self.totalAvailableVideosForSearchResult = 0
        self.errorOccurred = nil
        self.highestLoadedPage = -1
    }
    
    private func loadInitialVideos(ofItemType itemType: SearchResultItemType) async {
        self.resetSearchResults()
        switch await self.getVideosForSearchParameters(
            itemType: itemType,
            searchText: self.searchText
        ) {
        case let .success(data):
            AppLogger.debug(data)
            self.searchResultVideos = data.videos
            self.totalAvailableVideosForSearchResult = data.totalNumberOfVideos
            self.errorOccurred = nil
            self.highestLoadedPage = 0
        case let .failure(error):
            AppLogger.error(error.localizedDescription)
            self.searchResultVideos = []
            self.totalAvailableVideosForSearchResult = 0
            self.errorOccurred = error
            self.highestLoadedPage = -1
        }
        self.isPageLoaded = true
    }
    
    private func getVideosForSearchParameters(
        itemType: SearchResultItemType,
        searchText: String
    ) async -> Result<SearchResultData, BusinessError> {
        let videoType = VideoType(searchResultItemType: selectedSearchResultItemType)
        return await getVideosOfSearchParametersUseCase.execute(
            searchResultInputData: SearchResultInputData(
                videoType: videoType,
                searchText: searchText,
                limit: pageLimit,
                page: highestLoadedPage + 1
            )
        )
    }
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
