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
        if let userData = libraryTabViewModel.userData {
            ScrollView {
                VStack {
                    switch userData {
                    case let .success(data):
                        VStack {
                            Text("libraryLoggedInAsLabel")
                                .font(.sdoCaption)
                            Text(data.userEmail)
                                .font(.sdoCallout)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                    case .failure:
                        Text("libraryLoggedInLabel")
                            .font(.sdoCallout)
                            .listRowSeparator(.hidden)
                            .padding(.vertical, 20)
                    }
                    
                    VStack {
                        NavigationLink {
                            MyAccountView()
                        } label: {
                            VStack {
                                HStack {
                                    Image(systemName: "person.crop.circle.fill")
                                        .padding(.horizontal, 5)
                                    Text("libraryMyAccountOptionLabel")
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                        
                        NavigationLink {
                            Text("About")
                        } label: {
                            VStack {
                                HStack {
                                    Image(systemName: "info.circle.fill")
                                        .padding(.horizontal, 5)
                                    Text("libraryAboutOptionLabel")
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 30)
                    
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
                    }
                }
                .navigationBarTitle(Text("libraryScreenTitle", comment: "Label: Navigation bar title of Library Screen"))
            .navigationBarTitleDisplayMode(.inline)
            }
        } else {
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
