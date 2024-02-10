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

struct Pokemon: Decodable, Identifiable{
    var id = UUID()
    
    var name: String
    var url: String
    
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
}

extension Pokemon {
    static let starters: [Pokemon] = [
        Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
        Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
        Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/"),
    ]
}
