//
//  HealthProgressView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/13/24.
//

import SwiftUI

struct ProgressRingView: View {
    @EnvironmentObject var healthManager: HealthManager
    
    var progress: Float
    var color: Color = Color(red: 60/255, green: 90/255, blue: 166/255)
    var buttonColor = Color(red: 1, green: 203/255, blue: 5/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.2)
                    .foregroundColor(.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 2.0), value: progress)
                    .overlay {
                        progress == 1 ? NavigationLink {
                            PokemonSelectionView()
                        } label: {
                            Image(.pokeball).resizable()
                        } : nil
                    }
                
            }
            .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    let progress: Float = 1.0
    return ProgressRingView(progress: progress).environmentObject(HealthManager())
}
