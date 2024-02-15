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
                ProgressRingView(progress: progress)
                ActivityCardView(activity: $healthManager.stepCount)
            }
            .navigationTitle("Today's Progress")
        }
    }
}

#Preview {
    StepCounterView().environmentObject(HealthManager())
}
