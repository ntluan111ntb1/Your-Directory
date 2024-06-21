//
//  VocabularyCardView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct VocabularyCardView: View {

    let vocabulary: Vocabulary

    var body: some View {
        VStack(alignment: .leading) {
                Text(vocabulary.word)
                    .fontStyle(.mediumBold)
                Text(vocabulary.phonetics)
                    .fontStyle(.mediumLight)
        }
        .padding(16)
        .background(
            Image(vocabulary.background)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedCornersShape(corners: .allCorners, radius: 24))
                .shadow(radius: 4, x:0, y: 4)
        )
        .padding(.horizontal, 16)
    }
}
