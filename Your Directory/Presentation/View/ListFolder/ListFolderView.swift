//
//  ListFolderView.swift
//  Your Directory
//
//  Created by LuanNT29 on 22/07/2024.
//

import SwiftUI

struct ListFolderView: View {
    @StateObject var viewModel = ListFolderViewModel()

    let folders: [Folder]
    let vocabularies: [Vocabulary]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
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
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(folders) { folder in
                        HStack {
                            FolderCardView(folder: folder, vocabularyByFolder: viewModel.getVocabularyByFolder(vocabularies: vocabularies, folder: folder)
                            )
                            VStack {
                                ButtonIcon(
                                    iconsName: "square.and.pencil.circle",
                                    size: .title2,
                                    color: ConvertColor.colorFromHex("FD841F")
                                ) {
                                }
                                Spacer()
                                ButtonIcon(
                                    iconsName: "trash.circle", 
                                    size: .title2,
                                    color: ConvertColor.colorFromHex("CF0A0A")
                                ) {
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
        .background {
            Color.background
        }
    }
}

#Preview {
    ListFolderView(
        folders: AppConstants.mockFolders,
        vocabularies: AppConstants.mockVocabularies
    )
}
