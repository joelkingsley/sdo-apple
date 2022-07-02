//
//  SDOApp.swift
//  Shared
//
//  Created by Joel Kingsley on 08/04/2022.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct SDOApp: App {
    @StateObject var authViewModel = AuthenticationViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environmentObject(authViewModel)
            .onAppear {
              GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let user = user {
                  self.authViewModel.state = .signedIn(user)
                } else if let error = error {
                  self.authViewModel.state = .signedOut
                  print("There was an error restoring the previous sign-in: \(error)")
                } else {
                  self.authViewModel.state = .signedOut
                }
              }
            }
            .onOpenURL { url in
              GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
