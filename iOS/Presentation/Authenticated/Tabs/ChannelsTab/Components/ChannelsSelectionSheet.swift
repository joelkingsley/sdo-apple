//
//  ChannelsSelectionSheet.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 12/10/2022.
//

import SwiftUI
import MapKit

struct ChannelsSelectionSheet: View {
    @ObservedObject var channelsTabViewModel: ChannelsTabViewModel
    
    var body: some View {
        NavigationView {
            switch channelsTabViewModel.channelsData {
            case let .success(data):
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text("channelsSelectionSheetFilterByRegionLabel")
                            Picker("Regions", selection: $channelsTabViewModel.selectedCountryFilter) {
                                ForEach($channelsTabViewModel.listOfRegions, id: \.self) { option in
                                    Text(option.wrappedValue)
                                }
                            }
                            .pickerStyle(.automatic)
                            Spacer()
                        }
                        Divider()
                        ForEach(data.channels) { channel in
                            Button {
                                channelsTabViewModel.setCenter(with: channel.coordinate)
                            } label: {
                                VStack {
                                    HStack {
                                        Text(channel.channelName)
                                            .padding(.horizontal, 20)
                                            .font(.sdoBody)
                                        Spacer()
                                    }
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .searchable(
                    text: $channelsTabViewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "channelsSelectionSheetSearchPlaceholderLabel"
                )
                .navigationTitle("channelsSelectionSheetNavigationTitle")
                .navigationBarTitleDisplayMode(.inline)
            case let .failure(error):
                // TODO: Handle error
                Text(error.localizedDescription)
            case .none:
                // TODO: Handle error
                Text("This shouldn't appear")
            }
        }
    }
}

struct ChannelsSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsSelectionSheet(channelsTabViewModel: ChannelsTabViewModel())
    }
}
