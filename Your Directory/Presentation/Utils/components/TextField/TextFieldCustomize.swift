//
//  TextFieldCustomize.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI

struct TextFieldCustomize: View {
    @Binding var text: String

    @State var boderColor: Color = .lightBlue

    let label: String
    let placeholder: String
    var action: (() -> Void)? = nil
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .fontStyle(.largeBold)
            TextField(placeholder, text: $text)
                .onSubmit {
                    action?()
                }
            .padding(12)
            .background {
                RoundedCornersShape(corners: .allCorners, radius: 8)
                    .fill(.white)
            }
            .background {
                RoundedCornersShape(corners: .allCorners, radius: 8)
                    .stroke()
                    .shadow(color: .black, radius: 4, x: 0, y: 6)
            }
        }
    }
}

#Preview {
    TextFieldCustomize(
        text: .constant(""), 
        label: "Tên của bạn là gì?",
        placeholder: "Nhập tên của bạn ở đây nè!"
    )
}
