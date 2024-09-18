//
//  HomeView+ListVocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

extension HomeView {
    func makeListVocabulary() -> some View {
        VStack {
            HStack {
                Text("Danh sách từ vựng")
                    .fontStyle(.mediumBold)
                Spacer()
                Button {
                    isShowListVocabulary = true
                } label: {
                    Text("Xem toàn bộ")
                }
            }
            .padding(.horizontal)
            ListVocabulary(vocabularies: vocabularies, folders: folders) { vocabulary in
                handleTapVocabularyCard(vocabulary)
            }
        }
    }
}
