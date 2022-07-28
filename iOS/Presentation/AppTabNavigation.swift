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
                HomeTabView()
            }
            .tabItem {
                Label(LocalizedStringKey("tabHomeLabel"), systemImage: "house.fill")
                    .accessibilityLabel(LocalizedStringKey("tabHomeLabel"))
            }.tag(Tab.Home)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            
            // Music Tab
            NavigationView {
                SearchTabView()
            }.tabItem {
                Label(LocalizedStringKey("tabSearchLabel"), systemImage: "magnifyingglass")
                    .accessibilityLabel(LocalizedStringKey("tabSearchLabel"))
            }.tag(Tab.Search)
            
            // Subscriptions Tab
            NavigationView {
                SubscriptionsTabView()
            }.tabItem {
                Label(LocalizedStringKey("tabSubscriptionsLabel"), systemImage: "rectangle.stack.badge.play.fill")
                    .accessibilityLabel(LocalizedStringKey("tabSubscriptionsLabel"))
            }.tag(Tab.Subscriptions)
            
            // Library Tab
            NavigationView {
                LibraryTabView()
            }.tabItem {
                Label(LocalizedStringKey("tabLibraryLabel"), systemImage: "play.rectangle.on.rectangle.fill")
                    .accessibilityLabel(LocalizedStringKey("tabLibraryLabel"))
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
