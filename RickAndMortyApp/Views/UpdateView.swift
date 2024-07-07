//
//  UpdateView.swift
//  RickAndMortyApp
//
//  Created by Артём Амаев on 7.07.24.
//

import SwiftUI

struct UpdateView: View {    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                //action
            }) {
                Label("UPDATE NOW", systemImage: "exclamationmark.triangle")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    UpdateView()
}
