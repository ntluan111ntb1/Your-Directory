//
//  FavoriteVocabilariesView.swift
//  Your Directory
//
//  Created by LuanNT29 on 28/08/2024.
//

import SwiftUI

struct FavoriteVocabulariesView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var vocabularies: [Vocabulary]
    @State var selectedVocabulary: Vocabulary? = nil
    let handleTapVocabularyCard: (Vocabulary) -> Void
    @State var vocabulariesState: VocabulariesState = .favorited

    var progress: CGFloat {
        CGFloat(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count) / CGFloat(VocabulariesState.favorited.vocabularys(from: vocabularies).count)
    }

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                makeNavigation()
                makeFilter()
            }
            .background(
                Image("bg_favorite_vocabularies")
                    .resizable()
                    .frame(height: 240)
                    .scaledToFit()
                    .clipShape(
                        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 40)
                    )
                    .ignoresSafeArea()
            )
            .overlay(alignment: .bottom, content: {
                makeProcess()
            })
            .zIndex(1)
            makeListVocabulary()
        }
    }
}

#Preview {
    FavoriteVocabulariesView(vocabularies: .constant(AppConstants.mockVocabularies)) { _ in }
}
