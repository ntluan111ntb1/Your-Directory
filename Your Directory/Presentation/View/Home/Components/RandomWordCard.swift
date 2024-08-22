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
            ButtonIcon(iconsName: "repeat.circle", size: .title, color: Color.ograngeCustome) {
                handleRandomNewWord()
            }
            .padding(8)
            HStack {
                GIFView(type: .name("dice"))
                    .frame(width: 75, height: 75)
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text(vocabulary.word)
                            .fontStyle(.largeBold)
                            .foregroundStyle(Color.ograngeCustome)
                        Text(vocabulary.phonetics)
                            .fontStyle(.mediumLight)
                        Spacer()
                    }
                    Text(vocabulary.descriptions[0].definition ?? "")
                        .foregroundStyle(Color.blueCustome)
                        .lineLimit(2)
                }
            }
            .padding()
        }
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 12)
                .fill(.white)
                .stroke(Color.blueCustome, lineWidth: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    RandomWordCard(vocabulary: Vocabulary(word: "hello", phonetics: "həˈlō", audio: "", descriptions: [], partOfSpeech: "", folderId: UUID(), vocabularyNote: nil, publishAt: "")) {
        
    }
}
