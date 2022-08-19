//
//  LibraryTabView.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct LibraryTabView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        Button("Sign Out") {
            authViewModel.signOut()
        }
        .navigationBarTitle(Text("libraryScreenTitle", comment: "Label: Navigation bar title of Library Screen"))
    }
}

struct LibraryTabView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryTabView()
    }
}
