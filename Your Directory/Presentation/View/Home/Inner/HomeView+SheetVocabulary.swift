//
//  HomeView+SheetVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI

extension HomeView {
    func makeSheetVocabulary(vocabulary: Vocabulary) -> some View {
        VStack {
            NavigationStack {
                DetailVocabularyView(
                    vocabulary: .constant(vocabulary),
                    folders: $folders,
                    note: vocabulary.vocabularyNote ?? "",
                    selectedFolder: viewModel.getFolder(
                        folders: folders,
                        folderId: vocabulary.folderId
                    ) ?? (folders.first ?? Folder(name: "", color: "", publishAt: "")),
                    typeOfView: typeOfVocabularyView,
                    dismiss: {
                        viewModel.vocabulary = nil
                    }
                ) { toastStatus, toastMessage, vocabulary in
                    self.toastMessage = toastMessage
                    self.toastStatus = toastStatus
                    switch typeOfVocabularyView {
                    case .add:
                        guard let newVocabulary = vocabulary else { return }
                        vocabularies.insert(newVocabulary, at: 0)
                    case .update:
                        guard let vocabulry = viewModel.vocabulary else { return }
                        if let index = self.vocabularies.firstIndex(of: vocabulry) {
                            if let vocabularyUpdated = vocabulary {
                                self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                                self.vocabularies[index].folderId = vocabularyUpdated.folderId
                            } else {
                                self.vocabularies.remove(at: index)
                            }
                        }
                    }
                    viewModel.vocabulary = nil
                    isShowToast = true
                }
            }
        }
        .presentationDetents([.medium, .large])
        .presentationCornerRadius(38)
    }
}
