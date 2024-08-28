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
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text(vocabulary.word)
                            .fontStyle(.largeBold)
                            .foregroundStyle(Color.blueCustome)
                        Text(vocabulary.phonetics)
                            .fontStyle(.mediumLight)
                            .foregroundStyle(Color.deepPurpleCustome)
                        Spacer()
                    }
                    Text(vocabulary.descriptions[0].definition ?? "")
                        .foregroundStyle(Color.deepPurpleCustome)
                        .lineLimit(1)
                    Button {
                        handleRandomNewWord()
                    } label: {
                        HStack {
                            Image(systemName: "repeat.circle")
                            Text("Từ Khác")
                                .fontStyle(.smallBold)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .foregroundStyle(.white)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 62)
                            .fill(Color.deepPurpleCustome)
                    }
                    .cornerRadius(62)
                }
                .padding(.leading, 20)
                .padding(.vertical, 16)
                Image("ic_random_card")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .offset(x: 16)
                    .padding(.bottom, 16)
            }
        }
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 28)
                .fill(Color.lightPurpleCustome)
        )
        .padding(.horizontal)
    }
}

#Preview {
    RandomWordCard(vocabulary: Vocabulary(word: "hello", phonetics: "həˈlō", audio: "", descriptions: [], partOfSpeech: "", folderId: UUID(), vocabularyNote: nil, publishAt: "")) {
        
    }
}
