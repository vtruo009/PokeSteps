//
//  PokemonSelectionView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/14/24.
//

import SwiftUI

struct PokemonSelectionView: View {
//    @EnvironmentObject var pokemonManager: PokemonManager
    var surprisePokemons: [Pokemon]
    @State var selected: Pokemon? = nil
    
    var body: some View {
//        let surprisePokemons = pokemonManager.getSurprisePokemons()
            VStack {
                ForEach(surprisePokemons) { pokemon in
                    PokemonView(viewStyle: .surprise, pokemon: pokemon)
                }
            }
    }
}

//extension PokemonSelectionView {
//    func binding(for pokemon: Pokemon) -> Binding<Pokemon> {
//        guard let index = pokemonManager.index(of: pokemon) else {
//            fatalError("Pokemon not found!")
//        }
//        return $pokemonManager.pokemons[index]
//    }
//}

#Preview {
    PokemonSelectionView(surprisePokemons: Pokemon.samplePokemons)/*.environmentObject(PokemonManager())*/
}
