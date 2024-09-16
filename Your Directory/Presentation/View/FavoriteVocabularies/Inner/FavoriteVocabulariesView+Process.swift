//
//  FavoriteVocabulariesView+Process.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

extension FavoriteVocabulariesView {
    func makeProcess() -> some View {
        VStack {
            HStack {
                Text("Tổng số: \(VocabulariesState.favorited.vocabularys(from: vocabularies).count)")
                Spacer()
                Text("Đã học: \(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count)")
            }
            ProgressView(value: progress)
        }
        .padding()
        .background(
            Color.white.clipShape(RoundedCornersShape(corners: .allCorners, radius: 12))
                .shadow(radius: 4)
        )
        .padding(.horizontal, 24)
        .offset(y: 84)
    }
}

