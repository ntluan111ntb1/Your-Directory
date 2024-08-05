//
//  FolderCardView.swift
//  Your Directory
//
//  Created by LuanNT29 on 22/07/2024.
//

import SwiftUI

struct FolderCardView: View {

    let folder: Folder
    let vocabularyByFolder: [Vocabulary]

    var body: some View {
        ZStack {
            RoundedCornersShape(
                corners: .allCorners,
                radius: 20
            )
            .fill(ConvertColor.colorFromHex(folder.color))
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(folder.name)
                        .fontStyle(.largeBold)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(vocabularyByFolder) { folder in
                        HStack {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 8, height: 8)
                            Text(folder.word)
                                .fontStyle(.medium)
                        }
                    }
                }
                .padding(.leading)
            }
            .padding()
        }
        .foregroundStyle(.white)
        .background {
            Color.white.clipShape(
                RoundedCornersShape(
                    corners: .allCorners,
                    radius: 24
                )
            )
        }
    }
}
