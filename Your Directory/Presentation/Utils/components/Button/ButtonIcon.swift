//
//  ButtonIcon.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/08/2024.
//

import SwiftUI

struct ButtonIcon: View {
    let iconsName: String
    let size: Font
    let color: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: iconsName)
                .font(size)
                .fontWeight(.bold)
                .foregroundStyle(color)
        }
    }
}

