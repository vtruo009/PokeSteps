//
//  StepCounterView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct StepCounterView: View {
    @EnvironmentObject var healthManager: HealthManager
    
    var body: some View {
        NavigationStack {
            let progress: Float = Float(healthManager.stepCount.amount / healthManager.stepCount.goal)
            
            VStack {
                Spacer()
                ProgressRingView(progress: progress)
    //            ActivityStatsView(activity: healthManager.stepCount)
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    NavigationLink(destination: PokedexView()) {
                        Image(systemName: "apps.ipad")
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    StepCounterView().environmentObject(HealthManager())
}
