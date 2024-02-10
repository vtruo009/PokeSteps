//
//  PokemonFetchingClient.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import Foundation

struct PokemonFetchingClient {
    private static func loadJSONData() -> Data {
        guard let filePath = Bundle.main.path(forResource: "pokemon", ofType: "json") else {
            fatalError("Cannot find pokemon.json file!")
        }
        let url = URL(fileURLWithPath: filePath)
        return try! Data(contentsOf: url)
    }
    
    static func getPokemons() throws -> [Pokemon] {
        let jsonData = loadJSONData()
        do {
            let response = try JSONDecoder().decode(Response.self, from: jsonData)
            return response.pokemons
        } catch {
            fatalError("Cannot decode pokemon.json: \(error)")
        }
    }
}
