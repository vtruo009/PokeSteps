//
//  ContentView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

struct StarterSelectionView: View {
    @StateObject var pokemonData: PokemonData = PokemonData()
    let buttonW: Double = 100
    let buttonH: Double = 50
    let buttonColor: Color = Color(red: 42/255, green: 117/255, blue: 187/255)
    var selectedStarter: Pokemon? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ForEach(Pokemon.starters) { starter in
                    Button {
                        print("Selected \(starter.name)!")
                    } label: {
                        PokemonView(pokemon: starter)
                    }
                }
                Spacer()
                Button {
                    print("Started Selected. Go to next view!")
                } label: {
                    RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .frame(width: buttonW, height: buttonH)
                        .foregroundColor(buttonColor)
                        .overlay(
                            Text("Confirm")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .bold, design: .monospaced))
                        )
                }
                Spacer()
            }
            .navigationTitle(Text("Select Starter"))
        }
    }
}

#Preview {
    StarterSelectionView()
}
