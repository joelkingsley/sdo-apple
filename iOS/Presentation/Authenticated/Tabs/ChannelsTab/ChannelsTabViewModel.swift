//
//  ChannelsTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit
import Combine

@MainActor
class ChannelsTabViewModel: ObservableObject {
    // MARK: - Use Cases
    
    private let getChannelsDataUseCase = GetChannelsDataUseCase(
        channelsRepository: HasuraChannelRepository(
            graphQLService: HasuraGraphQLService()))
    private let filterChannelsUseCase = FilterChannelsUseCase()
    
    // MARK: - Properties
    
    @Published var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 0,
                longitude: 0
            ),
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
    @Published var channelsData: Result<GetChannelsData, BusinessError>?
    @Published var filteredChannels: [GetChannelsData.ChannelData] = []
    @Published var searchText: String = ""
    @Published var isShowingSearchSheet = false
    
    /// Selected region for filtering channels
    @Published var selectedRegion: Locale.Region = {
        Locale.Region.isoRegions.first ?? .world
    }()
    
    /// List of all regions
    @Published var listOfRegions: [Locale.Region] = {
        Locale.Region.isoRegions
    }()
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Methods
    
    func onLoaded() {
        Task {
            await getChannels()
        }
        $selectedRegion.sink { [weak self] region in
            guard let self = self,
                  let channelsData = self.channelsData,
                  case let .success(data) = channelsData
            else {
                return
            }
            self.filteredChannels = self.filterChannelsUseCase.execute(data.channels, withRegion: region)
        }.store(in: &cancellables)
    }
    
    func setCenter(with coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 750,
            longitudinalMeters: 750
        )
        isShowingSearchSheet = false
    }
    
    private func getChannels() async {
        switch await getChannelsDataUseCase.execute() {
        case let .success(data):
            channelsData = .success(data)
            filteredChannels = data.channels
            if let firstChannel = data.channels.first {
                region = MKCoordinateRegion(
                    center: firstChannel.coordinate,
                    latitudinalMeters: 750,
                    longitudinalMeters: 750
                )
            }
        case let .failure(error):
            channelsData = .failure(error)
        }
    }
}
