//
//  ContentView+DetailVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension ContentView {
    func makeDetailVocabulary(vocabulary: Vocabulary) -> some View {
        DetailVocabularyView(
            vocabulary: $viewModel.vocabulary,
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
                // Check if add vocabulary from card ramdom word
                // --> should be random new word
                if isShouldRandomWord {
                    viewModel.getRandomWords()
                }
            case .update:
                guard let vocabulry = viewModel.vocabulary else { return }
                if let index = self.vocabularies.firstIndex(of: vocabulry) {
                    if let vocabularyUpdated = vocabulary {
                        self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                        self.vocabularies[index].folderId = vocabularyUpdated.folderId
                        self.vocabularies[index].isStudy = vocabularyUpdated.isStudy
                        self.vocabularies[index].isFavorite = vocabularyUpdated.isFavorite
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

