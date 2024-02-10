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
                PokemonView(pokemon: starter)
            }
        }
    }
}

#Preview {
    StarterSelectionView()
}
