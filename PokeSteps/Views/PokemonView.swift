//
//  PokemonView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var pokemonData: PokemonData
    var pokemon: Pokemon
    let dimension: Double = 140
    
    var body: some View {
        let pokemonID: Int = pokemon.isUnlocked ? pokemonData.getPokemonID(pokemon: pokemon) : 0
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
        VStack {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: dimension, height: dimension)
            } placeholder: {
                ProgressView()
                    .frame(width: dimension, height: dimension)
            }
            .background(.thinMaterial)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("\(pokemon.isUnlocked ? pokemon.name.capitalized : "?????")")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.starters[0]).environmentObject(PokemonData())
}
