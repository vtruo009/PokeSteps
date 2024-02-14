//
//  HealthProgressView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/13/24.
//

import SwiftUI

struct HealthProgressView: View {
    @Binding var progress: Float
    var color: Color = Color(red: 60/255, green: 90/255, blue: 166/255)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0), value: progress)
        }
        .frame(width: 160, height: 160)
    }
}

#Preview {
    @State var progress: Float = 0.75
    return HealthProgressView(progress: $progress)
}