//
//  HomeView+ListFolder.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI
struct FolderCardHomeView: View {
    let text: String
    let imageDefaul: String
    let imageSelected: String
    let isSelected: Bool

    var body: some View {
        HStack {
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    HStack {
                        Image(systemName: isSelected ? imageSelected : imageDefaul)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                            .padding(12)
                    }
                    .background(Color.deepPurpleCustome)
                    .clipShape(Circle())
                    Text(text)
                        .fontStyle(.smallBold)
                        .foregroundStyle(Color.deepPurpleCustome)
                }
                Spacer()
            }
        }
    }
}
extension HomeView {
    func makeListFolder() -> some View {
        HStack {
            FolderCardHomeView(text: "Tất Cả", imageDefaul: "square.split.2x2", imageSelected: "square.split.2x2.fill", isSelected: true)
            FolderCardHomeView(text: "Yêu Thích", imageDefaul: "heart", imageSelected: "heart.fill", isSelected: false)
            FolderCardHomeView(text: "Đã Học", imageDefaul: "checkmark.rectangle.stack", imageSelected: "checkmark.rectangle.stack.fill", isSelected: false)
            FolderCardHomeView(text: "Kiểm Tra", imageDefaul: "graduationcap", imageSelected: "graduationcap.fill", isSelected: false)
        }
    }
}
