//
//  PokemonDetailsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/24/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
             PokemonView()
            
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0)) M")
            }
        }
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: .samplePokemon).environmentObject(ViewModel())
}
