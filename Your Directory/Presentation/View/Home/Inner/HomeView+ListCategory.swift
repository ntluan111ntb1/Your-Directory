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
                            .fontStyle(.mediumBold)
                            .padding(8)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedCornersShape(corners: .allCorners, radius: 16)
                                .fill(ConvertColor.colorFromHex(folder.color))
                                .shadow(radius: 2, x:0, y: 4)
                            )
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    .onTapGesture {
                        selectedFolder = folder
                    }
                }
            }
        }
        .padding(.top, 8)
    }
}
