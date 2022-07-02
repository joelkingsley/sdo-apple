//
//  ContentView.swift
//  Shared
//
//  Created by Joel Kingsley on 08/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State var isNavigationBarHidden: Bool = true
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        return Group {
            switch authViewModel.state {
            case .signedIn:
              #if os(iOS)
                AppTabNavigation(isNavigationBarHidden: self.$isNavigationBarHidden)
              #else
                NotAvailableView()
              #endif
            case .signedOut:
              #if os(iOS)
                SignInView()
              #else
                NotAvailableView()
              #endif
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
