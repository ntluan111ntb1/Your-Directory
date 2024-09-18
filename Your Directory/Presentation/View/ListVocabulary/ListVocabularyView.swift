//
//  ListVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

struct ListVocabularyView: View {
    @Binding var vocabularies: [Vocabulary]

    let handleTapVocabularyCard: (Vocabulary) -> Void

    @State var vocabulariesState: VocabulariesState = .all

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                makeNavigation()
            }
            makeListVocabulary()
        }
        .background(alignment: .top, content: {
            Image("bg_favorite_vocabularies")
                .resizable()
                .frame(height: 240)
                .scaledToFit()
                .clipShape(
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 48)
                )
                .ignoresSafeArea()
        })
    }
}

#Preview {
    ListVocabularyView(vocabularies: .constant(AppConstants.mockVocabularies)) { _ in
    }
}
