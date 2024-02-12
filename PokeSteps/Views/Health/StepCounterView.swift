//
//  HomeScreenView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct StepCounterView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Circle()
                    .frame(width: 250)
                    .padding()
                Spacer()
                ActivityCardView(activity: Activity(name: "steps", amount: "8,291", goal: "10,000", image: "figure.walk"))
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Go to Pokemons!")
                    } label: {
                        Image(systemName: "circle")
                    }
                }
            }
            .toolbar(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    StepCounterView()
}
