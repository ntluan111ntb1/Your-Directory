//
//  DetailVocabulary+Content.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/07/2024.
//

import SwiftUI

extension DetailVocabularyView {
    func makeContentOfVocabulary() -> some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(vocabulary.word)
                        .font(.largeTitle)
                    Text("(\(vocabulary.partOfSpeech))")
                        .fontStyle(.mediumLight)
                    Spacer()
                }
                Button {
                    viewModel.handleSound(sound: vocabulary.audio)
                } label: {
                    HStack {
                        Image(systemName: viewModel.statePlaySound ? "speaker.wave.3.fill" : "speaker.wave.1.fill")
                        Text(vocabulary.phonetics)
                            .fontStyle(.medium)
                    }
                }
                Divider()
            }
            .padding(.horizontal)
            ScrollView() {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Definition")
                            .fontStyle(.mediumBold)
                        Spacer()
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(vocabulary.descriptions, id: \.definition) { description in
                            if let des = description.definition {
                                Text("- \(des)")
                                    .fontStyle(.medium)
                            }
                            if let example = description.example {
                                Text("ex: \(example)")
                                    .fontStyle(.smallLight)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
