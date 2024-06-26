//
//  TextFieldImage.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct TextFieldImageGif: View {
    @Binding var text: String

    let imageName: String
    let placeholder: String
    let sizeImage: CGFloat?

    var body: some View {
        HStack {
            GIFView(type: .name(imageName))
                .frame(width: sizeImage, height: sizeImage)
            TextField(placeholder, text: $text)
            Button {
                text = ""
            } label: {
                Image(systemName: "xmark")
            }
            Button {
                handlePaste()
            } label: {
                Image(systemName: "doc.on.clipboard")
            }
        }
    }
    private func handlePaste() {
        if let pasteboardString = UIPasteboard.general.string {
            text = pasteboardString
        }
    }
}
