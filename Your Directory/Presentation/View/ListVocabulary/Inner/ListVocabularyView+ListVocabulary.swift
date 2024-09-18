//
//  ListVocabularyView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension ListVocabularyView {
    func makeListVocabulary() -> some View {
        ScrollView {
            ListVocabulary(vocabularies: vocabulariesState.vocabularys(from: vocabularies), folders: []) { vocabulary in
                handleTapVocabularyCard(vocabulary)
            }
        }
    }
}
