//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI


struct CharacterDetailView: View {
    let characterID: Int
    
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: viewModel.character?.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }
                
                VStack {
                    HStack {
                        InfoRow(title: "status", value: viewModel.character?.status ?? "Unknown", color: .blue)
                        InfoRow(title: "gender", value: viewModel.character?.gender ?? "Unknown", color: .red)
                    }
                    HStack {
                        InfoRow(title: "type", value: viewModel.character?.type.isEmpty ?? true ? "None" : viewModel.character?.type ?? "Unknown", color: .purple)
                        InfoRow(title: "species", value: viewModel.character?.species ?? "Unknown", color: .green)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.character?.name.uppercased() ?? "")
                    .font(.headline)
            }
        }
        .onAppear {
            viewModel.fetchCharacter(byID: characterID)
        }
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            HStack {
                Image(systemName: "bell")
                    .foregroundColor(color)
                Text(value)
                    .minimumScaleFactor(0.7)
            }
            .font(.system(size: 20))
            .padding(20)
            
            Spacer()
            
            Text(title.uppercased())
                .font(.system(size: 20).bold())
                .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                .foregroundColor(color)
                .background(.gray.opacity(0.1))
                .cornerRadius(6)
        }
        .frame(maxHeight: 160)
    }
}

#Preview {
    NavigationView {
        CharacterDetailView(characterID: 10)
    }
}


