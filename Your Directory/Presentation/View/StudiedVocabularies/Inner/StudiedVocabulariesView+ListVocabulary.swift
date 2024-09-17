//
//  StudiedVocabulariesView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension StudiedVocabulariesView {
    func makeListVocabulary() -> some View {
        ScrollView {
            ListVocabularyView(vocabularies: vocabulariesState.vocabularys(from: vocabularies), folders: []) { vocabulary in
                selectedVocabulary = vocabulary
            }
        }
    }
}
