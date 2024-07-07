//
//  CharactersView.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 180, maximum: 180))
    ]
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns,
                          spacing: 10
                ) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(characterID: character.id)) {
                            CharacterCell(character: character)
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            .refreshable {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    CharactersView()
}
