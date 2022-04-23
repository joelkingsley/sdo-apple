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
        case Music
        case Subscriptions
        case Library
    }
    
    @State private var selection: Tab = .Home
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeTabView()
            }.tabItem {
                Label("Home", systemImage: "house.fill")
                    .accessibilityLabel(Text("Home"))
            }.tag(Tab.Home)
            
            NavigationView {
                MusicTabView()
            }.tabItem {
                Label("Music", systemImage: "music.note")
                    .accessibilityLabel(Text("Music"))
            }.tag(Tab.Music)
            
            NavigationView {
                SubscriptionsTabView()
            }.tabItem {
                Label("Subscriptions", systemImage: "rectangle.stack.badge.play.fill")
                    .accessibilityLabel(Text("Subscriptions"))
            }.tag(Tab.Subscriptions)
            
            NavigationView {
                LibraryTabView()
            }.tabItem {
                Label("Library", systemImage: "play.rectangle.on.rectangle.fill")
                    .accessibilityLabel(Text("Library"))
            }.tag(Tab.Library)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
