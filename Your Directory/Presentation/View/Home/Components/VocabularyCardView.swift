//
//  VocabularyCardView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct VocabularyCardView: View {

    let vocabulary: Vocabulary
    
    let tapHandle: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
                HStack {
                    Text(vocabulary.word)
                        .fontStyle(.mediumBold)
                    Spacer()
                }
                Text(vocabulary.phonetics)
                    .fontStyle(.mediumLight)
        }
        .padding(16)
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 12)
                .fill(.white)
                .shadow(radius: 2, x: 0, y: 4)
        )
        .onTapGesture {
            tapHandle()
        }
    }
}
