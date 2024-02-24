//
//  PokemonDetailsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/24/24.
//

import SwiftUI

struct PokemonDetailsView: View {
    var selectedPokemon: Pokemon
    
    var body: some View {
       Text(selectedPokemon.name.capitalized)
    }
}

#Preview {
    PokemonDetailsView(selectedPokemon: .samplePokemons[0])
}
