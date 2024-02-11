//
//  HealthStatsView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct StatsCard: View {
    let cardWidth: Double = 320
    let cardHeight: Double = 200
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack {
                HStack(alignment: .center) {
                    Text("Goal: 10,000").font(.system(.caption, design: .monospaced))
                    Spacer()
                    Image(systemName: "figure.walk")
                        .foregroundColor(.green)
                }
                VStack {
                    Text("5,923").font(.system(size: 36, design: .monospaced))
                    Text("steps")
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    StatsCard()
}
