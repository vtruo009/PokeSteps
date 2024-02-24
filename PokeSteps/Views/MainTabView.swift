//
//  MainTabView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/14/24.
//

import SwiftUI

struct MainTabView: View {
//    @StateObject var pokemonManager: PokemonManager = PokemonManager()
//    @StateObject var healthManager: HealthManager = HealthManager()
    
    var body: some View {
        TabView {
            Group {
                StepCounterView()
                    .tabItem { Label("Steps", systemImage: "figure.walk" ) }
                PokedexView()
                    .tabItem { Label("Pokedex", systemImage: "folder.fill") }
            }
        }
        .environmentObject(PokemonManager())
        .environmentObject(HealthManager())
    }
}

#Preview {
    MainTabView()
}
