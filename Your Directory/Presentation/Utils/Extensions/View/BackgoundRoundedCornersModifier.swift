//
//  BackgoundRoundedCornersModifier.swift
//  Your Directory
//
//  Created by LuanNT29 on 28/08/2024.
//

import Foundation
import SwiftUI

struct BackgoundRoundedCornersModifier: ViewModifier {
    let color: Color
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .background(
                RoundedCornersShape(corners: .allCorners, radius: radius)
                    .fill(color)
            )
    }
}


extension View {
    func backgroundRoundedCorners(color: Color, radius: CGFloat) -> some View {
        self.modifier(BackgoundRoundedCornersModifier(color: color, radius: radius))
    }
}
