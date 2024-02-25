//
//  PokemonDetailsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/24/24.
//

import SwiftUI

struct PokemonDetailsView: View {
    var pokemon: Pokemon
    
    var body: some View {
       Text("\(pokemon.name.capitalized) unlocked!")
            .font(.system(size: 40, design: .monospaced))
    }
}

#Preview {
    PokemonDetailsView(pokemon: .samplePokemons[0])
}
