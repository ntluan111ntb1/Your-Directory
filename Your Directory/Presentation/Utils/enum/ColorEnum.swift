//
//  Color.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

enum CustomColor: String, CaseIterable, Identifiable {
    case style1 = "#FFE9D0"
    case style2 = "#FFFED3"
    case style3 = "#BBE9FF"
    case style4 = "#B1AFFF"
    case style5 = "#D8EFD3"
    case style6 = "#95D2B3"

    var id: String { self.rawValue }
    
    var color: Color {
        return ConvertColor.colorFromHex(self.rawValue)
    }
    
    var name: String {
        switch self {
        case .style1: return "style1"
        case .style2: return "style2"
        case .style3: return "style3"
        case .style4: return "style4"
        case .style5: return "style5"
        case .style6: return "style6"
        }
    }
}
