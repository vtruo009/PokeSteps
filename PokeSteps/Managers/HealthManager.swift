//
//  HealthManager.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date = Calendar.current.startOfDay(for: Date())
}

extension Double {
    func displayString() -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2 // Adjust as needed

            return formatter.string(from: NSNumber(value: self)) ?? ""
        }
}

class HealthManager: ObservableObject {
    @Published var stepCount: Activity = Activity(name: "steps", amount: 0.0, image: "figure.walk")
    
    let healthStore = HKHealthStore()
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [steps]
        
        Task {
            do {
                debugPrint("Authorizing...")
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                self.fetchStepCount()
            } catch {
                debugPrint("Error fetching data: \(error)")
            }
        }
    }
    
    func fetchStepCount() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: Date.startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                debugPrint("Error getting today's step data: \(error!)")
                return
            }
            
            let stepCount = round(quantity.doubleValue(for: .count()))
            debugPrint("step count: \(stepCount)")
            
            DispatchQueue.main.async {
                self.stepCount.amount = stepCount
            }
        }
        
        healthStore.execute(query)
    }
}
