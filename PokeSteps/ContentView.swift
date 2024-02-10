//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonData: PokemonData = PokemonData()
    
    var body: some View {
        Text("\(pokemonData.pokemons.count)")
        ForEach(pokemonData.pokemons) { pokemon in
            Text("\(pokemon.name)")
        }
    }
}

#Preview {
    ContentView()
}
