//
//  TextFieldImage.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct TextFieldImage: View {
    @Binding var text: String

    @State var isEdit = false
    let imageName: String
    let placeholder: String
    let sizeImage: CGFloat?

    var body: some View {
        HStack {
            Image(imageName)
                .frame(width: sizeImage, height: sizeImage)
            TextField(placeholder, text: $text)
        }
    }
}
