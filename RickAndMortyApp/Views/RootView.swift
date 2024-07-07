//
//  RootView.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI

struct RootView: View {
    @ObservedObject private var remoteConfigManager = RemoteConfigManager.shared
    
    var body: some View {
        if remoteConfigManager.isLoading {
            ProgressView()
        } else {
            if remoteConfigManager.needForceUpdate {
                UpdateView()
            } else {
                TabsView()
            }
        }
    }
}
