//
//  ProgressRingView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/13/24.
//

import SwiftUI

struct ProgressRingView: View {
    let progress: Float
    
    let ringSize: CGFloat = 200
    let pokeballSize: CGFloat = 160
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .foregroundStyle(.thinMaterial)
                .frame(width: ringSize)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                .foregroundColor(AppColor.darkBlue)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0), value: progress)
                .frame(width: ringSize)
            if progress >= 1.0 {
                Button {
                    print("Unlock pokemon")
                } label: {
                    Image(.pokeball)
                        .resizable()
                        .scaledToFit()
                        .frame(width: pokeballSize)
                }
            }
        }
    }
}

#Preview {
    ProgressRingView(progress: 1.0)
}

#Preview {
    ProgressRingView(progress: 0.7)
}
