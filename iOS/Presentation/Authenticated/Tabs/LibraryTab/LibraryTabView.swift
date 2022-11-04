//
//  LibraryTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI
import Kingfisher

struct LibraryTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var libraryTabViewModel = LibraryTabViewModel()
    
    var body: some View {
        switch libraryTabViewModel.userData {
        case let .success(data):
            List {
                VStack {
                    Text("libraryLoggedInAsLabel")
                        .font(.sdoCallout)
                    Text(data.userName)
                        .font(.sdoTitle2)
                        .bold()
                    Text(data.userEmail)
                        .font(.sdoCaption)
                }
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity)
                
                Button {
                    authViewModel.signOut()
                } label: {
                    HStack {
                        Spacer()
                        Text("librarySignOutLabel")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(Color(uiColor: .systemBackground))
                        Spacer()
                    }
                    .frame(height: 60)
                    .background(Color(uiColor: .label))
                    .cornerRadius(7)
                    .buttonBorderShape(.roundedRectangle(radius: 7))
                    .padding()
                    .listRowSeparator(.hidden)
                }
            }
            .navigationBarTitle(Text("libraryScreenTitle", comment: "Label: Navigation bar title of Library Screen"))
            .navigationBarTitleDisplayMode(.inline)
        case .failure:
            List {
                Text("libraryLoggedInLabel")
                    .font(.sdoCallout)
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                
                Button {
                    authViewModel.signOut()
                } label: {
                    HStack {
                        Spacer()
                        Text("librarySignOutLabel")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(Color(uiColor: .systemBackground))
                        Spacer()
                    }
                    .frame(height: 60)
                    .background(Color(uiColor: .label))
                    .cornerRadius(7)
                    .buttonBorderShape(.roundedRectangle(radius: 7))
                    .padding()
                    .listRowSeparator(.hidden)
                }
            }
            .navigationBarTitle(Text("libraryScreenTitle", comment: "Label: Navigation bar title of Library Screen"))
            .navigationBarTitleDisplayMode(.inline)
        case .none:
            ProgressView("progressViewLoadingLabel")
                .progressViewStyle(.circular)
                .onAppear {
                    libraryTabViewModel.onLoaded(user: authViewModel.getUser())
                }
        }
    }
}

struct LibraryTabView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryTabView()
    }
}
