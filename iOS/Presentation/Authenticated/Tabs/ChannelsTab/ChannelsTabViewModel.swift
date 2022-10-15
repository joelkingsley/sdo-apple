//
//  ChannelsTabViewModel.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit

@MainActor
class ChannelsTabViewModel: ObservableObject {
    // MARK: - Use Cases
    
    private let getChannelsDataUseCase = GetChannelsDataUseCase(
        channelsRepository: HasuraChannelRepository(
            graphQLService: HasuraGraphQLService()))
    
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
    @Published var searchText: String = ""
    @Published var isShowingSearchSheet = false
    @Published var selectedCountryFilter: String = {
        guard let identifier = Locale.Region.isoRegions.first?.identifier else { return "" }
        return Locale.current.localizedString(forRegionCode: identifier) ?? ""
    }()
    
    @Published var listOfRegions: [String] = {
        Locale.Region.isoRegions.map { region -> String in
            return Locale.current.localizedString(forRegionCode: region.identifier) ?? "N/A"
        }
    }()
    
    // MARK: - Methods
    
    func onLoaded() {
        Task {
            await getChannels()
        }
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
