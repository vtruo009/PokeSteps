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
//    @State var selected: Pokemon? = nil
    @State var selected: Bool = false
    let dimension: CGFloat = 140
    
    var body: some View {
//        let surprisePokemons = pokemonManager.getSurprisePokemons()
//            VStack {
        NavigationStack {
            ForEach(surprisePokemons) { pokemon in
                NavigationLink {
                    PokemonDetailsView(pokemon: pokemon)
//                        .toolbar(.hidden, for: .navigationBar)
                } label: {
                    VStack {
                        Image(.pokeball).resizable().frame(width: dimension, height: dimension)
                        Text("?????").foregroundStyle(.black)
                    }
                }
            }
        }
//            }
    }
}

#Preview {
    PokemonSelectionView(surprisePokemons: Pokemon.samplePokemons)/*.environmentObject(PokemonManager())*/
}
