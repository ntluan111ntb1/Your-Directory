//
//  Color.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

enum CustomColor: String, CaseIterable, Identifiable {
    case style1 = "#405D72"
    case style2 = "#667BC6"
    case style3 = "#153448"
    case style4 = "#124076"
    case style5 = "#0E5E6F"
    case style6 = "#424769"

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
