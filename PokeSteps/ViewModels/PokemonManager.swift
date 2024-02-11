//
//  PokemonsData.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

class PokemonManager: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var searchText: String = ""
    
    init() {
        loadPokemons()
    }
    
    var filteredPokemons: [Pokemon] {
        return searchText == "" ? pokemons : pokemons.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    func loadPokemons() {
        do {
            let pokemons = try PokemonFetchingClient.getPokemons()
            self.pokemons = pokemons
        } catch {
            fatalError("Cannot get Pokemons because \(error)")
        }
    }
    
    func getPokemonID(pokemon: Pokemon) -> Int {
        if let index = pokemons.firstIndex(where: { $0.name == pokemon.name}) {
            return index + 1
        }
        return 0
    }
}
