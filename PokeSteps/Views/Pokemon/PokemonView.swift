//
//  PokemonView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokemonView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewStyle: ViewStyle
    @Binding var pokemon: Pokemon
    private let dimension: Double = 140
    private let defaultUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/0.png"
    
    var body: some View {
        VStack {
            Button {
                pokemon.isUnlocked = true
                if viewStyle == .surprise {
                    dismiss()
                }
                debugPrint("\(pokemon.name) unlocked!")
            } label: {
                AsyncImage(url: URL(string: pokemon.isUnlocked ? pokemon.url : defaultUrl)) { image in
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
                .overlay {
                    viewStyle == .surprise ? Image(.pokeball).resizable().frame(width: dimension, height: dimension) : nil
                }
            }
            Text("\(pokemon.isUnlocked ? pokemon.name.capitalized : "?????")")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
        }
    }
}

extension PokemonView {
    enum ViewStyle {
        case pokedex
        case surprise
    }
}

#Preview {
    @State var pokemon: Pokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    return PokemonView(viewStyle: .surprise, pokemon: $pokemon)
}
