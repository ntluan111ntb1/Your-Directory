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
                makeHeader()
                Divider()
                makeContentOfVocabulary()
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
                foregroundColor: .white
            ) {
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
