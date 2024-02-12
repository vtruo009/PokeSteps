//
//  PokeStepsApp.swift
//  PokeSteps
//
//  Created by Van Truong on 2/9/24.
//

import SwiftUI

@main
struct PokeStepsApp: App {
    @StateObject var healthManager: HealthManager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            StepCounterView().environmentObject(healthManager.fe)
        }
    }
}
