//
//  SDOApp.swift
//  Shared
//
//  Created by Joel Kingsley on 08/04/2022.
//

import SwiftUI
import GoogleSignIn

@main
struct SDOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
          ContentView()
            .environmentObject(authViewModel)
            .onAppear {
                authViewModel.restorePreviousSignIn()
            }
            .onOpenURL { url in
              GIDSignIn.sharedInstance.handle(url)
            }
        }
    }
}
