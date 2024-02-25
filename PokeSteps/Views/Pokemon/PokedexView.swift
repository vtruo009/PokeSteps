//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokedexView: View {
    @EnvironmentObject var pokemonManager: PokemonManager
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(pokemonManager.filteredPokemons) { pokemon in
                        PokemonView(viewStyle: .pokedex, pokemon: binding(for: pokemon))
                    }
                }
                .navigationTitle("Pokemons")
                .animation(.easeIn(duration: 0.3), value: pokemonManager.filteredPokemons.count)
            }
            .searchable(text: $pokemonManager.searchText)
        }
    }
}

extension PokedexView {
    func binding(for pokemon: Pokemon) -> Binding<Pokemon> {
        guard let index = pokemonManager.index(of: pokemon) else {
            fatalError("Pokemon not found!")
        }
        return $pokemonManager.pokemons[index]
    }
}

#Preview {
    PokedexView().environmentObject(PokemonManager())
}
