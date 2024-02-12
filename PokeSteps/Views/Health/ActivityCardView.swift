//
//  HealthStatsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct Activity {
    var name: String
    var amount: String
    var goal: String
    var image: String
}

struct ActivityCardView: View {
    @State var activity: Activity
    
    let cardWidth: Double = 320
    let cardHeight: Double = 200
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Goal: \(activity.goal)").font(.system(.caption, design: .monospaced))
                    }
                    Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(.green)
                }
                VStack {
                    Text(activity.amount).font(.system(size: 36, design: .monospaced))
                    Text(activity.name)
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .padding()
        .frame(width: cardWidth, height: cardHeight)
    }
}

#Preview {
    ActivityCardView(activity: Activity(name: "steps", amount: "4,201", goal: "10,000", image: "figure.walk"))
}
