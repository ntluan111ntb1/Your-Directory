//
//  ListFolderView+Content.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/08/2024.
//

import SwiftUI

extension ListFolderView {
    func makeContent() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(folders) { folder in
                    HStack {
                        NavigationLink(value: folder) {
                            FolderCardView(folder: folder, vocabularyByFolder: viewModel.getVocabularyByFolder(vocabularies: vocabularies, folder: folder)
                            )
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            onTapCardFolder(folder)
                        })
                        VStack {
                            ButtonIcon(
                                iconsName: "square.and.pencil.circle",
                                size: .title2,
                                color: ConvertColor.colorFromHex("FD841F")
                            ) {
                                selectedFolder = folder
                                isUpdateFolder = true
                            }
                            Spacer()
                            ButtonIcon(
                                iconsName: "trash.circle",
                                size: .title2,
                                color: ConvertColor.colorFromHex("CF0A0A")
                            ) {
                                selectedFolder = folder
                                isShowPopupDetele = true
                            }
                        }
                        .padding(8)
                        .background(ConvertColor.colorFromHex("EDEDED").clipShape(
                            RoundedCornersShape(
                                corners: .allCorners,
                                radius: 20
                            )
                        ))
                    }
                }
            }
            .padding()
        }
    }
}

