//
//  Pokemon.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

struct Response: Decodable {
    var pokemons: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
}

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    
    let name: String
    let url: String
    var isUnlocked: Bool = false
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    func getPokedexID(in url: String) -> Int? {
        if let id = url.split(separator: "/").last {
            return Int(id)
        }
        return nil
    }
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
}

extension Pokemon {
    static var samplePokemon: Pokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    static var samplePokemons: [Pokemon] = [
        Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
        Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
        Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/")
    ]
}
