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
                text: vocabulary.vocabularyNote == nil
                ? $note
                : .constant(vocabulary.vocabularyNote ?? ""),
                imageName: "notebook",
                placeholder: "Ghi chú ở đây",
                sizeImage: 32
            )
            Divider()
            HStack {
                GIFView(type: .name("folder"))
                    .frame(width: 32, height: 32)
                Picker(
                    "Chọn danh mục",
                    selection: vocabulary.folder == nil
                    ? $selectedFolder
                    : .constant(vocabulary.folder ?? Folder(name: "", color: ""))) {
                    ForEach(folders) { folder in
                        HStack {
                            Circle()
                                .fill(ConvertColor.colorFromHex(folder.color))
                                .frame(width: 30, height: 30)
                            Text(folder.name)
                                .foregroundColor(.primary)
                        }
                        .tag(folder)
                    }
                }
            }
            .pickerStyle(.navigationLink)
        }
        .padding(.horizontal)
    }
}

