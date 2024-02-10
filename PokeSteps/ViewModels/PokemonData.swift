//
//  PokemonsData.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

class PokemonData: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
        loadPokemons()
    }
    
    func loadPokemons() {
        do {
            let pokemons = try PokemonFetchingClient.getPokemons()
            self.pokemons = pokemons
        } catch {
            fatalError("Cannot get Pokemons because \(error)")
        }
    }

}
