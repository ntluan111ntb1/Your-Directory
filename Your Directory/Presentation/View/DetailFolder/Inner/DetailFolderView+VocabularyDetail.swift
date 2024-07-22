//
//  DetailFolderView+VocabularyDetail.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI

extension DetailFolderView {
    func makeSheetVocabulary(vocabulary: Vocabulary) -> some View {
        VStack {
            NavigationStack {
                DetailVocabularyView(
                    vocabulary: .constant(vocabulary),
                    folders: .constant(folders),
                    note: vocabulary.vocabularyNote ?? "",
                    selectedFolder: viewModel.getFolder(folders: folders, folderId: folder.id)
                    ?? Folder(name: "", color: "", publishAt: ""),
                    typeOfView: .update,
                    dismiss: {
                        selectedVocabulary = nil
                    }
                ) { toastStatus, toastMessage, vocabulary in
                    self.toastMessage = toastMessage
                    self.toastStatus = toastStatus
                    guard let vocabulry = selectedVocabulary else { return }
                    if let index = self.vocabularies.firstIndex(of: vocabulry) {
                        if let vocabularyUpdated = vocabulary {
                            // update for another view
                            self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                            self.vocabularies[index].folderId = vocabularyUpdated.folderId
                        } else {
                            // update for another view
                            self.vocabularies.remove(at: index)
                        }
                    }
                    viewModel.filterVocabulariesByFolder(vocabularies: vocabularies, folderId: folder.id)
                    selectedVocabulary = nil
                    isShowToast = true
                }
            }
        }
        .presentationDetents([.medium, .large])
        .presentationCornerRadius(38)
    }
}
