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
        let progress: Float = Float(healthManager.stepCount.amount / healthManager.stepCount.goal)
        
        NavigationStack {
            VStack {
                Spacer()
                ProgressRingView(progress: 1.0)
                ActivityStatsView(activity: healthManager.stepCount)
            }
        }
        .onAppear() {
            healthManager.fetchStepCount()
        }
    }
}

#Preview {
    StepCounterView().environmentObject(HealthManager())
}
