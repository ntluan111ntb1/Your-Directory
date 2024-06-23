//
//  Color.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

enum CustomColor: String, CaseIterable, Identifiable {
    case vividViolet = "#A43AFF"
    case softMintGreen = "#CEEBC7"
    case vibrantOrangeRed = "#FF6D3B"
    case brightYellow = "#FAD13F"
    case paleLavender = "#EFCCFF"
    case lightSkyBlue = "#B3E5FF"
    
    var id: String { self.rawValue }
    
    var color: Color {
        return ConvertColor.colorFromHex(self.rawValue)
    }
    
    var name: String {
        switch self {
        case .vividViolet: return "Vivid Violet"
        case .softMintGreen: return "Soft Mint Green"
        case .vibrantOrangeRed: return "Vibrant Orange Red"
        case .brightYellow: return "Bright Yellow"
        case .paleLavender: return "Pale Lavender"
        case .lightSkyBlue: return "Light Sky Blue"
        }
    }
}
