//
//  SearchTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 28/07/2022.
//

import SwiftUI

struct SearchTabView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("searchBrowseLabel")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                HStack {
                    TileButton(text: "searchSermonsButtonLabel") {

                    }
                    Spacer()
                    TileButton(text: "searchDocumentariesButtonLabel") {

                    }
                }
                .padding(.horizontal, 10)
                HStack {
                    TileButton(text: "searchShortsButtonLabel") {

                    }
                    Spacer()
                    TileButton(text: "searchMusicButtonLabel") {

                    }
                }
                .padding(.horizontal, 10)
                TileButton(text: "searchChannelsButtonLabel") {
                    
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                
                Spacer()
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "searchBarPlaceholderLabel")
            .navigationTitle("searchScreenTitle")
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTabView()
    }
}
