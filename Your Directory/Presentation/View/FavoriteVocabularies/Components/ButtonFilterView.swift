//
//  ButtonFilterView.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

struct ButtonFilterView: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .fontStyle(.mediumBold)
                .foregroundStyle(isSelected ? .white : Color.deepPurpleCustome)
                .frame(width: 100)
        }
        .padding(.vertical, 8)
        .background(
            isSelected
            ? Color.deepPurpleCustome
            : Color.white
        )
        .clipShape(RoundedCornersShape(corners: .allCorners, radius: 24))
    }
}
