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
    
    init() {
        for family in UIFont.familyNames {
             AppLogger.debug(family)

             for names in UIFont.fontNames(forFamilyName: family){
                 AppLogger.debug("== \(names)")
             }
        }
        
        SDOTheme.initializeTheme()
    }
    
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
