//
//  HomeView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

extension HomeView {
    func makeListVocabulary() -> some View {
        ListVocabularyView(vocabularies: viewModel.vocabularys) { vocabulary in
            viewModel.vocabulary = vocabulary
            typeOfVocabularyView = .detail
        }
    }
}
