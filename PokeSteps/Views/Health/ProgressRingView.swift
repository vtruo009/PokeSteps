//
//  HealthProgressView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/13/24.
//

import SwiftUI

struct ProgressRingView: View {
    @EnvironmentObject var healthManager: HealthManager
    @EnvironmentObject var pokemonManager: PokemonManager
    
    @State private var isPresented: Bool = false
    
    var progress: Float
    var pokeballSize: CGFloat = 160
    var color: Color = Color(red: 60/255, green: 90/255, blue: 166/255)
    var buttonColor = Color(red: 1, green: 203/255, blue: 5/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.2)
                    .foregroundColor(.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 2.0), value: progress)
                if progress >= 1.0 {
                    Button {
                        print("Unlock pokemon!")
                    } label: {
                        Image(.pokeball).resizable().frame(width: pokeballSize, height: pokeballSize)
                    }
                }
            }
            .frame(width: 200, height: 200)
            
        }
    }
}

extension ProgressRingView {
    func binding(for pokemon: Pokemon) -> Binding<Pokemon> {
        guard let index = pokemonManager.index(of: pokemon) else {
            fatalError("Pokemon not found!")
        }
        return $pokemonManager.pokemons[index]
    }
}

#Preview {
    let progress: Float = 0.75
    let goalCompletedProgress: Float = 1.0
    return ProgressRingView(progress: goalCompletedProgress).environmentObject(HealthManager())
}
