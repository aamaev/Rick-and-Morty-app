//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI

struct CharacterCell: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 200)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(width: 180, height: 200)
            }
            
            Text(character.name)
                .font(.system(size: 20).bold())
                .foregroundColor(.primary)
                .lineLimit(1)
                .padding(.leading, 7)
            
            Text("Status: \(character.status)")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.top, 2)
                .padding(.leading, 7)
            
            Spacer()
        }
        .frame(width: 180, height: 270)
        .background(
            RoundedRectangle(cornerRadius: 2)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: -4, y: 4)
        )
    }
}
