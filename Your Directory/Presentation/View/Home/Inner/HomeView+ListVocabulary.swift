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
                ForEach(viewModel.vocabularys.vocabularys, id: \.id) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary)
                        .onTapGesture {
                            selectedVocabulary = vocabulary
                            isPresentDetailVocabulary.toggle()
                        }
                }
            }
        }
    }
}
