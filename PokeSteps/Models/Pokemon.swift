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
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let types: [PokemonTypes]
}

struct PokemonTypes: Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
}

extension Pokemon {
    static var samplePokemon: Pokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    static var samplePokemons: [Pokemon] = [
        Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
        Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
        Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/")
    ]
}
