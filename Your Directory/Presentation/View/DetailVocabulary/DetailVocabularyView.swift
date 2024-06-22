//
//  DetailVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct DetailVocabularyView: View {
    
    @StateObject var viewModel = DetailVocabularyViewModel()
    
    @Binding var vocabulary: Vocabulary
    @State var note = ""
    
    let textButton: String
    let dismiss: () -> Void
    var addVocabulary: ((String) -> Void)? = nil
    var deleteVocabulary: (() -> Void)? = nil
    
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
                .padding(.horizontal)
                Divider()
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
                    Divider()
                    TextFieldImageGif(
                        text: vocabulary.vocabularyNote == nil
                        ? $note
                        : .constant(vocabulary.vocabularyNote ?? ""),
                        imageName: "notebook",
                        placeholder: "Ghi chú ở đây",
                        sizeImage: 32
                    )
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
            .background(
                RoundedCornersShape(corners: .allCorners, radius: 38)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            ButtonFullWidthView(
                lable: textButton,
                color: .orangeCustomize,
                foregroundColor: .white) {
                    addVocabulary?(note)
                    deleteVocabulary?()
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}

#Preview {
    DetailVocabularyView(
        vocabulary: .constant(
            Vocabulary(
                word: "hello",
                phonetics: "/həˈləʊ/",
                audio: "https://api.dictionaryapi.dev/media/pronunciations/en/hello-au.mp3",
                descriptions: [
                    Vocabulary.Definition(definition: "definition", example: "example"),
                    Vocabulary.Definition(definition: "definition2", example: nil),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                    Vocabulary.Definition(definition: "definition3", example: "example"),
                ],
                partOfSpeech: "noun",
                vocabularyNote: ""
            )
        ),
        textButton: "Thêm từ này",
        dismiss: {}
    )
}
