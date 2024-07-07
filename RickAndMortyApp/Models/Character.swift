//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import Foundation

struct CharactersResponse: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}



