//
//  ButtonFullWidthView.swift
//  Locations
//
//  Created by Nguyễn Luân on 20/12/2023.
//

import SwiftUI

struct ButtonFullWidthView: View {
    let lable: String
    let color: Color
    let foregroundColor: Color

    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(lable)
                    .fontStyle(.largeBold)
                Spacer()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .foregroundStyle(foregroundColor)
        .background(color)
        .overlay {
            RoundedRectangle(cornerRadius: 64)
                .stroke(Color.lightBlue, lineWidth: 4)
        }
        .cornerRadius(62)
        .shadow(color: Color.lightBlue, radius: 4, x: 0, y: 4)
    }
}
