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
                    PokemonView(viewStyle: .surprise, pokemon: pokemon)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    PokemonSelectionView().environmentObject(PokemonManager())
}
