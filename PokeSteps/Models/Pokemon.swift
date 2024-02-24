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
