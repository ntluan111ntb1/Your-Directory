//
//  DetailVocabulary+Input.swift
//  Your Directory
//
//  Created by LuanNT29 on 08/07/2024.
//

import SwiftUI

extension DetailVocabularyView {
    func makeInput() -> some View {
        VStack {
            TextFieldImageGif(
                text: $note,
                imageName: "notebook",
                placeholder: "Ghi chú ở đây",
                sizeImage: 32
            )
            Divider()
        }
    }
}

