//
//  FavoriteVocabulariesView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

extension FavoriteVocabulariesView {
    func makeListVocabulary() -> some View {
        ScrollView {
            ListVocabulary(vocabularies: vocabulariesState.vocabularys(from: vocabularies), folders: []) { vocabulary in
                handleTapVocabularyCard(vocabulary)
            }
            .padding(.top, 88)
            .zIndex(0)
        }
    }
}
