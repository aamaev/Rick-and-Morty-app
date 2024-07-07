//
//  RemoteConfigManager.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import FirebaseRemoteConfig

class RemoteConfigManager: ObservableObject {
    static let shared = RemoteConfigManager()
    
    @Published var needForceUpdate: Bool = false
    @Published var isLoading: Bool = true
    
    private var remoteConfig: RemoteConfig
    
    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        isLoading = true
        remoteConfig.fetch { [weak self] status, error in
            if status == .success {
                self?.remoteConfig.activate { _, error in
                    DispatchQueue.main.async {
                        self?.needForceUpdate = self?.remoteConfig.configValue(forKey: "needForceUpdate").boolValue ?? false
                        self?.isLoading = false
                    }
                }
            } else {
                print("DEBUG: Error fetching remote config: \(error?.localizedDescription ?? "No error available.")")
                self?.isLoading = false
            }
        }
    }
}
