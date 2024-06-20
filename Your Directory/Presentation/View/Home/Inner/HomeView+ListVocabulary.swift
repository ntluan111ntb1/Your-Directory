//
//  HomeView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

extension HomeView {
    func makeListVocabulary() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(vocabularys.vocabularys, id: \.vocabulary) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                }
            }
        }
    }
}
