//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import Foundation
import SwiftUI

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    init() {
        self.fetchCharacters()
    }
    
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters = result.results
                    }
                } catch {
                    print("DEBUG: Failed to decode with list of characters: \(error)")
                }
            }
        }.resume()
    }
}
