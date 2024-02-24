//
//  PokemonView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct PokemonView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var pokemonManager: PokemonManager
    @State var viewStyle: ViewStyle
    var pokemon: Pokemon
    private let dimension: Double = 140
    
    var body: some View {
        NavigationStack {
            let pokemonID = pokemon.isUnlocked ? pokemonManager.getPokemonID(pokemon: pokemon) : 0
            let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
            
            VStack {
                //                        Button {
                //                            print("Go to Pokemon details!")
                //                            debugPrint("\(pokemon.name) unlocked!")
                //                        } label: {
                //                            AsyncImage(url: URL(string: url)) { image in
                //                                image
                //                                    .resizable()
                //                                    .scaledToFit()
                //                                    .frame(width: dimension, height: dimension)
                //                            } placeholder: {
                //                                ProgressView()
                //                                    .frame(width: dimension, height: dimension)
                //                            }
                //                            .background(.thinMaterial)
                //                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                //                        }
                NavigationLink {
                    PokemonDetailsView(selectedPokemon: pokemon)
                        .toolbar(.hidden, for: .navigationBar)
                } label: {
                    ZStack(alignment: .top) {
                        AsyncImage(url: URL(string: url)) { image in
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
                        viewStyle == .surprise ? Image(.pokeball).resizable().frame(width: dimension, height: dimension) : nil
                    }
                }
                .disabled(!pokemon.isUnlocked)
//                AsyncImage(url: URL(string: url)) { image in
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: dimension, height: dimension)
//                } placeholder: {
//                    ProgressView()
//                        .frame(width: dimension, height: dimension)
//                }
                Text("\(pokemon.isUnlocked ? pokemon.name.capitalized : "?????")")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
            }
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
    //    @State var pokemon: Pokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    return PokemonView(viewStyle: .surprise, pokemon: Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")).environmentObject(PokemonManager())
}
