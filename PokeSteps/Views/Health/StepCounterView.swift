//
//  HomeScreenView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct StepCounterView: View {
    @EnvironmentObject var healthManager: HealthManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Circle()
                    .frame(width: 250)
                    .padding()
                Spacer()
                if !healthManager.activities.isEmpty {
                    ActivityCardView(activity: healthManager.activities[0])
                }
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
            .onAppear() {
                print("Creating the health manager...")
                healthManager.fetchStepCount()
            }
        }
    }
}

#Preview {
    StepCounterView().environmentObject(HealthManager())
}
