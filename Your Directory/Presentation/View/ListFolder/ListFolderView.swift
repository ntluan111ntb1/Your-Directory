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
                .shadow(radius: 2, x:0, y: 4)
            }
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(folders) { folder in
                            FolderCardView(folder: folder, vocabularyByFolder: viewModel.getVocabularyByFolder(vocabularies: vocabularies, folder: folder))
                        }
                    }
                    .padding()
                }
            }
            .padding(.top)
            .background {
                Color.background.clipShape(RoundedCornersShape(
                    corners: [.topRight], radius: 40
                ))
                .shadow(radius: 2, x:0, y: -4)
            }

        }
        .background()
    }
}

#Preview {
    ListFolderView(
        folders: AppConstants.mockFolders,
        vocabularies: AppConstants.mockVocabularies
    )
}
