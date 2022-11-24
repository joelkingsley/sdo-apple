//
//  MyAccountView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 24/11/2022.
//

import SwiftUI

struct MyAccountView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("myAccountConnectedAccountsLabel")
                    .font(.sdoTitle3)
                    .bold()
                    .padding()
                
                VStack {
                    ForEach(authViewModel.getConnectedSocialAccounts()) { userInfo in
                        VStack {
                            HStack {
                                Image(systemName: userInfo.providerImageSystemName)
                                    .padding(.horizontal, 5)
                                Text(userInfo.providerName)
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
                    showingAlert = true
                } label: {
                    HStack {
                        Spacer()
                        Text("myAccountDeleteAccountLabel")
                            .font(.custom("Gill Sans", size: 20))
                            .foregroundColor(Color(uiColor: .systemBackground))
                        Spacer()
                    }
                    .frame(height: 60)
                    .background(Color(uiColor: .systemRed))
                    .cornerRadius(7)
                    .buttonBorderShape(.roundedRectangle(radius: 7))
                    .padding()
                }
                .alert("myAccountConfirmDeleteText", isPresented: $showingAlert) {
                    Button("myAccountYesOptionLabel", role: .destructive) {
                        authViewModel.deleteUser()
                    }
                    Button("myAccountNoOptionLabel", role: .cancel) {}
                }
                .padding(.vertical, 20)
                
                Spacer()
            }
            .navigationBarTitle(Text("myAccountLabel", comment: "Label: Navigation bar title of My Account Screen"))
        .navigationBarTitleDisplayMode(.inline)
        }

    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
