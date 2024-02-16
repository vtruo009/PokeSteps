//
//  HealthStatsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct Activity {
    var name: String
    var amount: Double
    var goal: Double = 5000
    var image: String
}

struct ActivityCardView: View {
    var activity: Activity
    
    let todayCountSize: CGFloat = 50
    let todayCountLabelSize: CGFloat = 20
    
    var body: some View {
        Spacer()
        Text("\(activity.amount.displayString())")
            .font(.system(size: todayCountSize, design: .monospaced))
        Text("\(activity.name)")
            .font(.system(size: todayCountLabelSize, design: .monospaced))
        Spacer()
        Text("5,120")
            .font(.system(size: (todayCountSize * 0.6), design: .monospaced))
        Text("yesterday")
            .font(.system(size: (todayCountLabelSize * 0.6), design: .monospaced))
        Spacer()
    }
}

#Preview {
//    @State var activity: Activity = Activity(name: "steps", amount: 4201, image: "figure.walk")
    return ActivityCardView(activity: Activity(name: "steps", amount: 4201, image: "figure.walk"))
}
