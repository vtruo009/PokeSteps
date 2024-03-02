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
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("**No.** # \(viewModel.pokemonDetails?.id ?? 0)")
                HStack {
                    Text("**Weight**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0))kg")
                    Text("**Height**: \(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0))m")
                }
                HStack(spacing: 15) {
                    ForEach(viewModel.pokemonDetails?.types ?? [], id: \.slot) { type in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 35)
                            .foregroundColor(AppColor.typeColor[type.type.name])
                            .overlay {
                                Text(type.type.name)
                                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                            }
                    }
                }
                .padding()
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
