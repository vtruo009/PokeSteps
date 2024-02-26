//
//  AppColor.swift
//  PokeSteps
//
//  Created by Van Truong on 2/24/24.
//

import Foundation
import SwiftUI

class AppColor {
    static var darkBlue: Color = Color(red: 60/255, green: 90/255, blue: 166/255)
    static var lightBlue: Color = Color(red: 42/255, green: 117/255, blue: 187/255)
    static var darkYellow: Color = Color(red: 199/255, green: 160/255, blue: 8/255)
    static var lightYellow: Color = Color(red: 1, green: 203/255, blue: 5/255)
    
    static var typeColor: [String: Color] = [
        "normal": Color(hex: "#A8A77A"),
        "fire": Color(hex: "#EE8130"),
        "water": Color(hex: "#6390F0"),
        "electric": Color(hex: "#F7D02C"),
        "grass": Color(hex: "#7AC74C"),
        "ice": Color(hex: "#96D9D6"),
        "Fighting": Color(hex: "#C22E28"),
        "poison": Color(hex: "#A33EA1"),
        "ground": Color(hex: "#E2BF65"),
        "flying": Color(hex: "#A98FF3"),
        "psychic": Color(hex: "#F95587"),
        "bug": Color(hex: "#A6B91A"),
        "rock": Color(hex: "#B6A136"),
        "ghost": Color(hex: "#735797"),
        "dragon": Color(hex: "#6F35FC"),
        "dark": Color(hex: "#705746"),
        "steel": Color(hex: "#B7B7CE"),
        "fairy": Color(hex: "#D685AD")
    ]
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
