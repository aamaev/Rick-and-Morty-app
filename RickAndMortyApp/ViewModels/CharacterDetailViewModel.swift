//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character?
    
    func fetchCharacter(byID id: Int) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Character.self, from: data)
                    DispatchQueue.main.async {
                        self.character = result
                    }
                } catch {
                    print("DEBUG: Failed to decode character: \(error)")
                }
            }
        }.resume()
    }
}
