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
    @State var note: String
    @State var selectedFolder: Folder

    @State var isShowPopupDelete = false
    @State var isDisableButton = false
    @State var isFirstAppear = true

    let typeOfView: EventType

    let dismiss: () -> Void
    var resultHandle: ((Status, String, Vocabulary?) -> Void)

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
                foregroundColor: .black,
                isDisable: isDisableButton
            ) {
                viewModel.handleVocabulary(
                    vocabulary: vocabulary,
                    typeOfHandle: typeOfView,
                    note: note,
                    folder: selectedFolder
                ) { status, message, newVocabulary in
                    resultHandle(status, message, newVocabulary)
                }
            }
        }
        .padding(16)
        .background(Color.background)
        .onChange(of: note) {
            isDisableButton = false
        }
        .onChange(of: selectedFolder) {
            isDisableButton = false
        }
        .onAppear {
            if typeOfView == .update && isFirstAppear {
                isDisableButton = true
            }
            isFirstAppear = false
        }
        .popupConfirm(
            isPresented: $isShowPopupDelete,
            image: "question",
            title: "Xóa Từ Vựng Này ?",
            message: "Bạn có chắc muốn xóa từ vựng này hong?",
            textButtonAgree: "Xóa luôn",
            textButtonCancel: "Thôi"
        ) {
            viewModel.deleteVocabulary(vocabulary: vocabulary) { status, message in
                resultHandle(status, message, nil)
            }
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
                folderId: UUID(),
                vocabularyNote: "",
                publishAt: ""
            )
        ),
        folders: .constant([]),
        note: "",
        selectedFolder: Folder(name: "", color: "", publishAt: ""),
        typeOfView: .update,
        dismiss: {}
    ) { _, _, _ in

    }
}
