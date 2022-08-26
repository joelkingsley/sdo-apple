//
//  AppTabNavigation.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 09/04/2022.
//

import SwiftUI

struct AppTabNavigation: View {
    enum Tab {
        case Home
        case Search
        case Subscriptions
        case Library
    }
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Binding var isNavigationBarHidden: Bool
    @State private var selection: Tab = .Home
    
    var body: some View {
        TabView(selection: $selection) {
            // Home Tab
            NavigationView {
                HomeTabView(authViewModel: authViewModel)
            }
            .tabItem {
                Label("homeTabLabel", systemImage: "house.fill")
                    .accessibilityLabel("homeTabLabel")
            }.tag(Tab.Home)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            
            // Search Tab
            NavigationView {
                SearchTabView()
            }
            .tabItem {
                Label("searchTabLabel", systemImage: "magnifyingglass")
                    .accessibilityLabel("searchTabLabel")
            }.tag(Tab.Search)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            
            // Subscriptions Tab
            NavigationView {
                SubscriptionsTabView()
            }.tabItem {
                Label("subscriptionsTabLabel", systemImage: "rectangle.stack.badge.play.fill")
                    .accessibilityLabel("subscriptionsTabLabel")
            }.tag(Tab.Subscriptions)
            
            // Library Tab
            NavigationView {
                LibraryTabView()
            }.tabItem {
                Label("libraryTabLabel", systemImage: "play.rectangle.on.rectangle.fill")
                    .accessibilityLabel("libraryTabLabel")
            }.tag(Tab.Library)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation(
            isNavigationBarHidden: Binding.constant(true))
        .environment(\.locale, Locale(identifier: "en"))
    }
}
