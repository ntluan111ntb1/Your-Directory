//
//  HomeView+Search.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

extension HomeView {
    func makeSearch() -> some View {
        TextFieldImageGif(
            text: $search,
            imageName: "search",
            placeholder: "Bạn muốn tìm từ vựng nào?",
            sizeImage: 40
        )
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 24)
                .fill(.white)
        )
        .padding(.horizontal, 16)
    }
}
