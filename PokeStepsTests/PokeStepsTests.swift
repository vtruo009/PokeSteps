//
//  PokeStepsTests.swift
//  PokeStepsTests
//
//  Created by Van Truong on 2/9/24.
//

import XCTest
@testable import PokeSteps

final class PokeStepsTests: XCTestCase {
    
    private func getTestJSONData() -> Data {
        guard let filePath = Bundle.main.path(forResource: "pokemon", ofType: "json") else {
            fatalError("Cannot find pokemon.json file!")
        }
        let url = URL(fileURLWithPath: filePath)
        return try! Data(contentsOf: url)
    }

    func testPokemonModel() {
        let jsonData = getTestJSONData()
        do {
            _ = try JSONDecoder().decode(Response.self, from: jsonData)
        } catch {
            XCTFail("Failed to decode JSON into the model: \(error)")
        }
    }

}
