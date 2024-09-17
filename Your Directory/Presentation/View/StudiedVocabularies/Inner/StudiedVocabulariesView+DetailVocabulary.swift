//
//  StudiedVocabulariesView+DetailVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension StudiedVocabulariesView {
    func makeDetailVocabulary(vocabulary: Vocabulary) -> some View {
        DetailVocabularyView(
            vocabulary: $selectedVocabulary,
            folders: .constant([]),
            note: vocabulary.vocabularyNote ?? "",
            selectedFolder: Folder(name: "", color: "", publishAt: ""),
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
                    self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                    self.vocabularies[index].folderId = vocabularyUpdated.folderId
                    self.vocabularies[index].isStudy = vocabularyUpdated.isStudy
                    self.vocabularies[index].isFavorite = vocabularyUpdated.isFavorite
                } else {
                    self.vocabularies.remove(at: index)
                }
            }
            selectedVocabulary = nil
            isShowToast = true
        }
        .presentationDetents([.medium, .large])
        .presentationCornerRadius(38)
    }
}
