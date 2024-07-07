//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person")
                }
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "globe")
                }
            EpisodesView()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabsView()
}
