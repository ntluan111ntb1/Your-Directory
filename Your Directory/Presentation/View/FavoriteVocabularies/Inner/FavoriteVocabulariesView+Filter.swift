//
//  FavoriteVocabulariesView+Filter.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

extension FavoriteVocabulariesView {
    func makeFilter() -> some View {
        HStack(alignment: .bottom) {
            ButtonFilterView(text: "Tất Cả", isSelected: vocabulariesState == .favorited) {
                vocabulariesState = .favorited
            }
            ButtonFilterView(text: "Đã Học", isSelected: vocabulariesState == .favoriteAndStudied) {
                vocabulariesState = .favoriteAndStudied
            }
            ButtonFilterView(text: "Chưa Học", isSelected: vocabulariesState == .favoriteAndNotStudied) {
                vocabulariesState = .favoriteAndNotStudied
            }
        }
        .padding(8)
        .backgroundRoundedCorners(color: .white.opacity(0.5), radius: 64)
        .padding(.horizontal)
    }
}

