//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct StarterSelectionView: View {
    @StateObject var pokemonData: PokemonData = PokemonData()
    
    var body: some View {
        NavigationStack {
            // Placeholder
            ForEach(Pokemon.starters) { starter in
                Text("\(starter.name.capitalized)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
            }
        }
    }
}

#Preview {
    StarterSelectionView()
}
