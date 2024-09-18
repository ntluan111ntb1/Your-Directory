//
//  TabBarItem.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/09/2024.
//

import SwiftUI

struct TabBarItem: View {
    let text: String
    let imageDefault: String
    let imageSelected: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(isSelected ? imageSelected : imageDefault)
                    .resizable()
                    .frame(width: 24, height: 24)
                if isSelected {
                    Text(text)
                        .fontStyle(.smallBold)
                }
            }
            .foregroundStyle(.white)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .backgroundRoundedCorners(
                color: isSelected ? Color.deepPurpleCustome : .white,
                radius: 24
            )
        }

    }
}
