//
//  HomeView+ListCategory.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

extension HomeView {
    func makeListCategory() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.folders) { category in
                    HStack {
                        Spacer()
                        Text(category.name)
                            .padding(8)
                            .background(RoundedCornersShape(corners: .allCorners, radius: 16).fill(ConvertColor.colorFromHex(category.color)))
                        Spacer()
                    }
                    .onTapGesture {
                        selectedCategory = category
                    }
                }
            }
        }
        .padding(.vertical, 8)
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 8)
                .fill(.white)
                .shadow(radius: 4)
        )
        .padding()
    }
}
