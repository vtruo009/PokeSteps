//
//  PokemonSelectionView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/14/24.
//

import SwiftUI

struct PokemonSelectionView: View {
    @EnvironmentObject var pokemonManager: PokemonManager
    
    var body: some View {
        let surprisePokemons = pokemonManager.getSurprisePokemons()
        NavigationStack {
            VStack {
                ForEach(surprisePokemons) { pokemon in
                    PokemonView(viewStyle: .surprise, pokemon: binding(for: pokemon))
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
    }
}

extension PokemonSelectionView {
    func binding(for pokemon: Pokemon) -> Binding<Pokemon> {
        guard let index = pokemonManager.index(of: pokemon) else {
            fatalError("Pokemon not found!")
        }
        return $pokemonManager.pokemons[index]
    }
}

#Preview {
    PokemonSelectionView().environmentObject(PokemonManager())
}
