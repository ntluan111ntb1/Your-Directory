//
//  HomeView+ListFolder.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

extension HomeView {
    func makeListFolder() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.folders) { folder in
                    HStack {
                        Spacer()
                        Text(folder.name)
                            .padding(8)
                            .background(RoundedCornersShape(corners: .allCorners, radius: 16).fill(ConvertColor.colorFromHex(folder.color)))
                        Spacer()
                    }
                    .onTapGesture {
                        selectedFolder = folder
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
