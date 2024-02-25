//
//  PokemonsData.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

//class PokemonManager: ObservableObject {
//    @Published var pokemons: [Pokemon] = []
//    @Published var searchText: String = ""
//    
//    init() {
//        loadPokemons()
//    }
//    
//    var lockedPokemons: [Pokemon] {
//        return pokemons.filter {
//            !$0.isUnlocked
//        }
//    }
//    
//    var filteredPokemons: [Pokemon] {
//        return searchText == "" ? pokemons : pokemons.filter {
//            $0.name.contains(searchText.lowercased()) && $0.isUnlocked
//        }
//    }
//    
//    func loadPokemons() {
//        do {
//            let pokemons = try PokemonFetchingClient.getPokemons()
//            self.pokemons = pokemons
//        } catch {
//            fatalError("Cannot get Pokemons because \(error)")
//        }
//    }
//    
//    func getPokemonID(pokemon: Pokemon) -> Int {
//        if let index = pokemons.firstIndex(where: { $0.name == pokemon.name}) {
//            return index + 1
//        }
//        return 0
//    }
//    
//    func getSurprisePokemons() -> [Pokemon] {
//        var surprisePokemons: [Pokemon] = []
//        
//        for _ in 0...2 {
//            if let pokemon = lockedPokemons.randomElement() {
//                surprisePokemons.append(pokemon)
//            }
//        }
//        
//        return surprisePokemons
//    }
//    
//    func index(of pokemon: Pokemon) -> Int? {
//        for i in pokemons.indices {
//            if pokemons[i].name == pokemon.name {
//                return i
//            }
//        }
//        return nil
//    }
//    
//    func getRandomPokemon() -> Pokemon? {
//        if let randomPokemon = lockedPokemons.randomElement() {
//            return randomPokemon
//        }
//        return nil
//    }
//}

class PokemonManager {
    func getPokemons() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemons: [Pokemon] = data.results
        return pokemons
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (PokemonDetail) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.cq/api/v2/pokemon/\(id)/", model: PokemonDetail.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
