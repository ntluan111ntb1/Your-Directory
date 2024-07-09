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
    @Binding var categorys: [Folder]
    @State var note = ""
    @State var selectedCategory = Folder(name: "", color: "")

    let textButton: String

    let dismiss: () -> Void
    var addVocabulary: ((String, Folder) -> Void)? = nil
    var deleteVocabulary: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                makeHeader()
                Divider()
                makeContentOfVocabulary()
                Divider()
                makeInput()
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
                addVocabulary?(note, selectedCategory)
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
                    Vocabulary.Definition(definition: "definition", example: "example")
                ],
                partOfSpeech: "noun",
                category: nil,
                vocabularyNote: ""
            )
        ),
        categorys: .constant([]),
        textButton: "Thêm từ này",
        dismiss: {}
    )
}
