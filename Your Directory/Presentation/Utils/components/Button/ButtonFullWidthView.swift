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
    var isDisable: Bool? = false

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
        .disabled(isDisable ?? false)
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .foregroundStyle(foregroundColor)
        .background(isDisable ?? false ? .gray : color)
        .overlay {
            RoundedRectangle(cornerRadius: 62)
                .stroke(.black, lineWidth: 4)
        }
        .cornerRadius(62)
    }
}