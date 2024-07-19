//
//  CreateFolder+Content.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/07/2024.
//

import SwiftUI

extension CreateFolderView {
    func makeContentOfFolder() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Text("Tên của thư mục:")
                    .fontStyle(.mediumBold)
                TextFieldImageGif(
                    text: $folder.name,
                    imageName: "notebook",
                    placeholder: "Tên của thể loại",
                    sizeImage: 40
                )
            }
            Text("Màu của thư mục:")
                .fontStyle(.mediumBold)
            VStack(alignment: .center) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(CustomColor.allCases) { color in
                        Button(action: {
                            self.selectedColor = color
                            folder.color = color.rawValue
                        }) {
                            Circle()
                                .fill(color.color)
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            Color.black,
                                            lineWidth: self.selectedColor == color ? 3 : 0
                                        )
                                )
                        }
                    }
                    .padding(4)
                }
            }
        }
    }
}
