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
    let action: () -> Void

    var body: some View {
        HStack {
            HStack {
                Spacer()
                VStack(spacing: 8) {
                    Button {
                        action()
                    } label: {
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
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .backgroundRoundedCorners(color: .white, radius: 24)
                }
                Spacer()
            }
        }
    }
}
extension HomeView {
    func makeListFolder() -> some View {
        HStack {
            FolderCardHomeView(text: "Yêu Thích", imageDefaul: "heart", imageSelected: "heart.fill", isSelected: typeOfFilterState == .favorite) {
                typeOfFilterState = .favorite
                isPresentFavoriteScreen = true
            }
            FolderCardHomeView(text: "Đã Học", imageDefaul: "checkmark.rectangle.stack", imageSelected: "checkmark.rectangle.stack.fill", isSelected: typeOfFilterState == .studied) {
                typeOfFilterState = .studied
                isPresentFavoriteScreen = true
            }
        }
    }
}
