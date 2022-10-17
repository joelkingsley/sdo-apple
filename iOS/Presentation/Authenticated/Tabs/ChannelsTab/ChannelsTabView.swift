//
//  ChannelsTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit

struct ChannelsTabView: View {
    @ObservedObject var channelsTabViewModel = ChannelsTabViewModel()
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var isShowingSearchSheet = false
    
    var body: some View {
        switch channelsTabViewModel.channelsData {
        case .success(let data):
            ZStack {
                MapView(region: $channelsTabViewModel.region, places: data.channels)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            isShowingSearchSheet = true
                        } label: {
                            Image(systemName: "list.bullet.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.accentColor)
                                .background(Color(uiColor: .systemBackground))
                                .clipShape(Circle())
                                .shadow(radius: 25)
                        }
                        .padding(.all, 20)
                    }
                    Spacer()
                        .frame(height: 20)
                }
            }
            .sheet(isPresented: $isShowingSearchSheet) {
                ChannelsSelectionSheet(channelsTabViewModel: channelsTabViewModel)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(
                Text("channelsScreenTitle", comment: "Label: Navigation bar title of Subscriptions Screen")
            )
        case .failure(let error):
            CustomErrorView(
                error: error,
                authViewModel: authViewModel
            )
        case .none:
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    channelsTabViewModel.onLoaded()
                }
        }
    }
}

struct ChannelsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsTabView()
    }
}
