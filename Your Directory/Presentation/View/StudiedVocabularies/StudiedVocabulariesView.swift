//
//  StudiedVocabulariesView.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

struct StudiedVocabulariesView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var vocabularies: [Vocabulary]

    let handleTapVocabularyCard: (Vocabulary) -> Void

    @State var vocabulariesState: VocabulariesState = .studied

    var progress: CGFloat {
        CGFloat(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count) / CGFloat(VocabulariesState.favorited.vocabularys(from: vocabularies).count)
    }

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
    StudiedVocabulariesView(vocabularies: .constant(AppConstants.mockVocabularies)) { _ in }
}
