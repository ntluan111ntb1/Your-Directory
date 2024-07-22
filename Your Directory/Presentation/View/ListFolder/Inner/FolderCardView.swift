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
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Spacer()
                Text(folder.name)
                    .fontStyle(.largeBold)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 8)
                Spacer()
            }
            .background(
                ConvertColor.colorFromHex(folder.color)
                    .clipShape(RoundedCornersShape(
                        corners: [.topLeft, .topRight],
                        radius: 24
                    ))
            )
            ZStack {
                RoundedCornersShape(
                    corners: [.bottomLeft, .bottomRight],
                    radius: 24
                )
                .fill(ConvertColor.colorFromHex(folder.color).opacity(0.2))
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Vocabulary of folder: ")
                            .fontStyle(.mediumBold)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 4) {
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
                }
                .padding()
            }
            .background {
                Color.white.clipShape(
                    RoundedCornersShape(
                        corners: [.bottomLeft, .bottomRight],
                        radius: 24
                    )
                )
            }
        }
    }
}
