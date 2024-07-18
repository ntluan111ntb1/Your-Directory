//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI
import ExytePopupView

struct DetailFolderView: View {
    // Environment variable to control navigation
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = DetailFolderViewModel()
    @Binding var folder: Folder
    @State var selectedVocabulary: Vocabulary? = nil
    @State var isShowPopupDetele = false


    let vocabularys: [Vocabulary]

    let resultHandle: (Status, String, Folder?) -> Void
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
            viewModel.getVocabulary(vocabularys: vocabularys, folderId: folder.id)
        }
        .background(Color.background)
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
        .popup(isPresented: $isShowPopupDetele, view: {
            PopupView(
                image: "question",
                title: "Xóa Folder Này ?",
                content: "Bạn có chắc muốn xóa folder này hong?",
                textButtonAgree: "Xóa luôn",
                textButtonCancel: "Thôi",
                handleAgree: {
                    presentationMode.wrappedValue.dismiss()
                    viewModel.deleteFolder(folder: folder) { status, message, folder in
                        resultHandle(status, message, folder)
                    }
                },
                handleCancel: {
                    isShowPopupDetele = false
                }
            )
            .padding(.horizontal)
        }, customize: {
            $0
                .type(.floater())
                .position(.bottom)
                .animation(.spring)
        })
        .toolbar {
            ToolbarItem {
                Menu {
                    Button(action: {

                    }) {
                        Text("Chỉnh sửa")
                        Image(systemName: "pencil")
                    }
                    Button(action: {
                        isShowPopupDetele = true
                    }) {
                        Text("Xóa")
                        Image(systemName: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}

#Preview {
    DetailFolderView(
        folder: .constant(Folder(name: "folder name", color: "", publishAt: "")),
        vocabularys: AppConstants.mockVocabularies) { _,_,_ in }
}
