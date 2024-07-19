//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI
import ExytePopupView

struct DetailFolderView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = DetailFolderViewModel()

    @Binding var folder: Folder
    let vocabularys: [Vocabulary]
    let resultHandle: (Status, String, Folder?) -> Void

    @State var selectedVocabulary: Vocabulary? = nil
    @State var isShowPopupDetele = false

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack(spacing: 16) {
            ListVocabularyView(vocabularies: viewModel.vocabularys) { vocabulary in
                selectedVocabulary = vocabulary
            }
            Spacer()
        }
        .onAppear {
            viewModel.filterVocabulariesByFolder(vocabularys: vocabularys, folderId: folder.id)
        }
        .background(Color.background)
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
        .popupConfirm(
            isPresented: $isShowPopupDetele,
            image: "question",
            title: "Xóa Folder Này ?",
            message: "Bạn có chắc muốn xóa folder này hong?",
            textButtonAgree: "Xóa luôn",
            textButtonCancel: "Thôi"
        ) {
            presentationMode.wrappedValue.dismiss()
            viewModel.deleteFolder(folder: folder) { status, message, folder in
                resultHandle(status, message, folder)
            }
        }
        .toolbar {
            ToolbarItem {
                makeMenu()
            }
        }
    }
}

#Preview {
    DetailFolderView(
        folder: .constant(Folder(name: "folder name", color: "", publishAt: "")),
        vocabularys: AppConstants.mockVocabularies) { _,_,_ in }
}
