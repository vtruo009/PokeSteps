//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var pokemonData: PokemonData = PokemonData()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(pokemonData.filteredPokemons) { pokemon in
                        if pokemon.isUnlocked {
                            Button {
                                print("Selected \(pokemon.name)!")
                            } label: {
                                PokemonView(pokemon: pokemon)
                            }
                        }
                    }
                }
                .navigationTitle("Pokedex")
                .environmentObject(pokemonData)
                .animation(.easeIn(duration: 0.3), value: pokemonData.filteredPokemons.count)
            }
            .searchable(text: $pokemonData.searchText)
        }
    }
}

#Preview {
    PokedexView()
}
