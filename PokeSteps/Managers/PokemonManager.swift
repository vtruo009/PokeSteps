//
//  PokemonsData.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

class PokemonManager {
    func getPokemons() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemons: [Pokemon] = data.results
        return pokemons
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
