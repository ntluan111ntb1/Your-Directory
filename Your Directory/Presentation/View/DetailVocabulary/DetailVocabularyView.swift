//
//  DetailVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI
import ExytePopupView

struct DetailVocabularyView: View {

    @StateObject var viewModel = DetailVocabularyViewModel()

    @Binding var vocabulary: Vocabulary
    @Binding var folders: [Folder]

    @State var note = ""
    @State var isShowPopupDelete = false
    @State var selectedFolder = Folder(name: "", color: "", publishAt: "")

    let typeOfView: TypeOfVocabularyView

    let dismiss: () -> Void
    var handleVocabulary: ((String, Folder) -> Void)? = nil
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
                lable: typeOfView.textButton,
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                handleVocabulary?(note, selectedFolder)
            }
        }
        .popup(isPresented: $isShowPopupDelete, view: {
            PopupView(
                image: "question",
                title: "Xóa Từ Vựng Này ?",
                content: "Bạn có chắc muốn xóa từ vựng này hong?",
                textButtonAgree: "Xóa luôn",
                textButtonCancel: "Thôi",
                handleAgree: {
                    deleteVocabulary?()
                },
                handleCancel: {
                    isShowPopupDelete = false
                }
            )
        }, customize: {
            $0
                .type(.floater())
                .position(.bottom)
                .animation(.spring)
        })
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
                folder: Folder(name: "", color: "", publishAt: ""),
                vocabularyNote: "",
                publishAt: ""
            )
        ),
        folders: .constant([]),
        typeOfView: .detail,
        dismiss: {}
    )
}
