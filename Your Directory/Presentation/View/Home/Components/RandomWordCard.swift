//
//  RandomWordCard.swift
//  Your Directory
//
//  Created by LuanNT29 on 13/08/2024.
//

import SwiftUI

struct RandomWordCard: View {
    let vocabulary: Vocabulary
    let handleRandomNewWord: () -> Void?
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ButtonIcon(iconsName: "repeat.circle", size: .title, color: Color.yellowCustome) {
                handleRandomNewWord()
            }
            .padding(4)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(vocabulary.word)
                        .fontStyle(.largeBold)
                    Text(vocabulary.phonetics)
                        .fontStyle(.mediumLight)
                    Spacer()
                }
                Text(vocabulary.descriptions[0].definition ?? "")
                    .lineLimit(1)
            }
            .padding()
        }
        .background(
            Color.white.clipShape(RoundedCornersShape(corners: .allCorners, radius: 12))
                .shadow(radius: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    RandomWordCard(vocabulary: Vocabulary(word: "hello", phonetics: "həˈlō", audio: "", descriptions: [], partOfSpeech: "", folderId: UUID(), vocabularyNote: nil, publishAt: "")) {
        
    }
}
