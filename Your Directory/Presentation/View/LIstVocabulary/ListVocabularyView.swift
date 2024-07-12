//
//  ListVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 12/07/2024.
//

import SwiftUI

struct ListVocabularyView: View {
    @StateObject var viewModel = ListVocabularyViewModel()

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let vocabularies: [Vocabulary]
    let tapHandle: (Vocabulary) -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(vocabularies, id: \.id) { vocabulary in
                    VocabularyCardView(vocabulary: vocabulary) {
                        tapHandle(vocabulary)
                    } playSound: {
                        viewModel.handleSound(sound: vocabulary.audio)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ListVocabularyView(vocabularies: AppConstants.mockVocabularies) { _ in

    }
}
