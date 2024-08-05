//
//  ListFolderView+Header.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/08/2024.
//

import SwiftUI

extension ListFolderView {
    func makeHeader() -> some View {
        HStack {
            Text("Danh Sách Folder")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 32)
        .padding(.bottom)
        .background {
            ConvertColor.colorFromHex("5b5450").clipShape(RoundedCornersShape(
                corners: [.bottomLeft], radius: 40
            ))
            .ignoresSafeArea()
        }
    }
}
