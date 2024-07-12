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
    @Binding var folders: [Folder]
    @State var note = ""
    @State var selectedFolder = Folder(name: "", color: "", publishAt: "")

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
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                addVocabulary?(note, selectedFolder)
                deleteVocabulary?()
            }
        }
        .padding(16)
        .background(Image("sheet"))
        .onAppear {
            self.selectedFolder = folders.first ?? Folder(name: "", color: "", publishAt: "")
        }
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
                folder: Folder(name: "", color: "", publishAt: ""),
                vocabularyNote: "",
                publishAt: ""
            )
        ),
        folders: .constant([]),
        textButton: "Thêm từ này",
        dismiss: {}
    )
}
