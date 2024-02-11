//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var pokemonData: PokemonData = PokemonData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(pokemonData.pokemons) { pokemon in
                    Button {
                        print("Selected \(pokemon.name)!")
                    } label: {
                        PokemonView(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
            .environmentObject(pokemonData)
        }
    }
}

#Preview {
    PokedexView()
}
