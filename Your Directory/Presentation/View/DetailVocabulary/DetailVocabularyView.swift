//
//  DetailVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct DetailVocabularyView: View {

    @Binding var vocabulary: Vocabulary

    let dismiss: () -> Void
    let deteleHandle: () -> Void

    @State var statePlaySound = false
    @StateObject private var soundManager = SoundManager()

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                HStack {
                    Text("Chi tiết từ vựng")
                        .fontStyle(.largeBold)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                Divider()
                VStack(spacing: 12) {
                    Text(vocabulary.word)
                        .font(.largeTitle)
                    Button {
                        soundManager.playSound(sound: vocabulary.audio)
                        statePlaySound.toggle()
                        if statePlaySound{
                            soundManager.audioPlayer?.play()
                        } else {
                            soundManager.audioPlayer?.pause()
                        }
                    } label: {
                        HStack {
                            Image(systemName: statePlaySound ? "speaker.wave.3.fill" : "speaker.wave.1.fill")
                            Text(vocabulary.phonetics)
                                .fontStyle(.mediumLight)
                        }
                    }
                }
//                TextFieldImage(
//                    text: $vocabulary.description,
//                    imageName: "description",
//                    placeholder: vocabulary.description,
//                    sizeImage: 40
//                )
            }
            .padding(16)
            .background(
                RoundedCornersShape(corners: .allCorners, radius: 38)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            Spacer()
            ButtonFullWidthView(
                lable: "Delete",
                color: .orangeCustomize,
                foregroundColor: .white) {
                    deteleHandle()
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}

#Preview {
    DetailVocabularyView(vocabulary: .constant(Vocabulary(
        word: "word",
        phonetics: "/dɪsˈmɪs/",
        audio: "audio",
        description: [
            Vocabulary.Definition(definition: "definition", example: "example"),
            Vocabulary.Definition(definition: "definition2", example: ""),
            Vocabulary.Definition(definition: "definition3", example: "example"),
        ],
        partOfSpeech: "partOfSpeech",
        background: ""
    )    ), dismiss: {}) { }
}
