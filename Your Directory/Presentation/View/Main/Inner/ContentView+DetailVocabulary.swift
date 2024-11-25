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
                listVocabularyViewModel.vocabularys.insert(newVocabulary, at: 0)
                // Check if add vocabulary from card ramdom word
                // --> should be random new word
                if isShouldRandomWord {
                    viewModel.getRandomWords()
                }
            case .update:
                guard let vocabulry = viewModel.vocabulary else { return }
                if let index = listVocabularyViewModel.vocabularys.firstIndex(of: vocabulry) {
                    if let vocabularyUpdated = vocabulary {
                        listVocabularyViewModel.vocabularys[index] = vocabularyUpdated
                    } else {
                        listVocabularyViewModel.vocabularys.remove(at: index)
                    }
                }
            }
            viewModel.vocabulary = nil
            isShowToast = true
        }
    }
}

