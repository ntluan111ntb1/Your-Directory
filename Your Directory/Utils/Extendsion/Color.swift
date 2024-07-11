//
//  Color.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import Foundation
import SwiftUI

extension Color {
    static var purpleCustomize: Color {
        return Color(UIColor(red: 164 / 255, green: 58 / 255, blue: 255 / 255, alpha: 1.0))
    }

    static var lightGreen: Color {
        return Color(UIColor(red: 206 / 255, green: 235 / 255, blue: 199 / 255, alpha: 1.0))
    }

    static var orangeCustomize: Color {
        return ConvertColor.colorFromHex("d6d0b6")
    }

    static var yellowCustome: Color {
        return ConvertColor.colorFromHex("fdc80a")
    }

    static var greenLight: Color {
        return ConvertColor.colorFromHex("d6dcc6")
    }

    static var greenDark: Color {
        return ConvertColor.colorFromHex("acb7a1")
    }

    static var lightPink: Color {
        return Color(UIColor(red: 239 / 255, green: 204 / 255, blue: 255 / 255, alpha: 1.0))
    }

    static var lightBlue: Color {
        return Color(UIColor(red: 179 / 255, green: 229 / 255, blue: 255 / 255, alpha: 1.0))
    }
}
