//
//  CreateCategory+Content.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/07/2024.
//

import SwiftUI

extension CreateCategoryView {
    func makeContentOfCategory() -> some View {
        VStack(spacing: 0) {
            TextFieldImageGif(
                text: $category,
                imageName: "notebook",
                placeholder: "Tên của thể loại",
                sizeImage: 40
            )
            VStack {
                Form {
                    Picker("Select a Color", selection: $selectedColor) {
                        ForEach(CustomColor.allCases) { color in
                            HStack {
                                Circle()
                                    .fill(color.color)
                                    .frame(width: 30, height: 30)
                                Text(color.name)
                                    .foregroundColor(.primary)
                            }
                            .tag(color)
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
}
