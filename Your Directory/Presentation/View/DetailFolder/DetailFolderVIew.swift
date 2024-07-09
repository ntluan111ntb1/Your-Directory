//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

struct DetailFolderView: View {
    @Binding var folder: Folder
    let remove: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                HStack {
                    Text("Tạo mới thể loại")
                        .fontStyle(.largeBold)
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                Divider()
                TextFieldImageGif(
                    text: $folder.name,
                    imageName: "notebook",
                    placeholder: "Tên của thể loại",
                    sizeImage: 40
                )
            }
            .padding(16)
            .background(
                RoundedCornersShape(corners: .allCorners, radius: 38)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            Spacer()
            ButtonFullWidthView(
                lable: "Xóa folder này",
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                remove()
            }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}
