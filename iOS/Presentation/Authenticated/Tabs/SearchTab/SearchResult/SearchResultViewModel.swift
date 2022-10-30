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
    
    /// The current search text
    @Published var searchText: String
    
    /// The current selected search result item type
    @Published var selectedSearchResultItemType: SearchResultItemType
    
    /// Constant to denote how many videos to fetch at a time
    private let pageLimit = 10
    
    // MARK: - Api data and view state
    
    /// Whether page loaded with initial data
    @Published var isPageLoaded: Bool = false
    
    /// The fetched videos for the current search parameters
    @Published var searchResultVideos: [SearchResultData.Video] = []
    
    /// Total number of videos available in the backend for current search parameters
    @Published var totalAvailableVideosForSearchResult: Int = 0
    
    /// Whether error occurred while loading initial data
    @Published var errorOccurred: BusinessError? = nil
    
    /// The last page of videos loaded for the current search parameters
    @Published var highestLoadedPage: Int = -1
    
    /// Whether more videos are being loaded for the current search parameters
    @Published var isLoadingMoreVideos: Bool = false
    
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
    
    func onLastVideoReached() {
        Task {
            if totalAvailableVideosForSearchResult > searchResultVideos.count {
                isLoadingMoreVideos = true
                switch await getVideosForSearchParameters(itemType: selectedSearchResultItemType, searchText: searchText) {
                case let .success(data):
                    var updatedVideos = self.searchResultVideos
                    updatedVideos.append(contentsOf: data.videos)
                    self.searchResultVideos = updatedVideos
                    self.highestLoadedPage = self.highestLoadedPage + 1
                case let .failure(error):
                    AppLogger.debug("Error occurred while loading more videos: \(error)")
                }
                isLoadingMoreVideos = false
            }
        }
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
