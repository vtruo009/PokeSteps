//
//  HomeScreenView.swift
//  PokeSteps
//
//  Created by Van Truong on 2/11/24.
//

import SwiftUI

struct HomeScreenView: View {
    private let adaptiveColumns = [
        GridItem(.fixed(190)),
        GridItem(.fixed(190))
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: adaptiveColumns) {
                StatsCard()
                StatsCard()
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
