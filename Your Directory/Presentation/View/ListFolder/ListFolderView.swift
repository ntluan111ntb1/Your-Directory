//
//  ListFolderView.swift
//  Your Directory
//
//  Created by LuanNT29 on 22/07/2024.
//

import SwiftUI

struct ListFolderView: View {
    @StateObject var viewModel = ListFolderViewModel()
    @StateObject var detailFolderViewModel = DetailFolderViewModel()

    @State var isUpdateFolder = false
    @State var isShowPopupDetele = false
    @State var selectedFolder = Folder(name: "", color: "", publishAt: "")

    @Binding var folders: [Folder]
    @Binding var vocabularies: [Vocabulary]

    let onTapCardFolder: (Folder) -> Void
    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            makeHeader()
            makeContent()
        }
        .background {
            Color.background
        }
        .sheet(isPresented: $isUpdateFolder, content: {
            CreateFolderView(
                isPresentSheet: $isUpdateFolder,
                folder: selectedFolder,
                selectedColor: .style1,
                eventType: .update
            ) { status, message, folder in
                if let folderUpdated = folder {
                    self.selectedFolder.name = folderUpdated.name
                    self.selectedFolder.color = folderUpdated.color
                    if let index = folders.firstIndex(where: { folder in
                        folderUpdated.id == folder.id
                    }) {
                        folders[index].name = folderUpdated.name
                        folders[index].color = folderUpdated.color
                    }
                }
                self.toastStatus = status
                self.toastMessage = message
                isShowToast.toggle()
                isUpdateFolder.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
        .popupConfirm(
            isPresented: $isShowPopupDetele,
            image: "question",
            title: "Xóa Folder Này ?",
            message: "Bạn có chắc muốn xóa folder này hong?",
            textButtonAgree: "Xóa luôn",
            textButtonCancel: "Thôi"
        ) {
            detailFolderViewModel.deleteFolder(folder: selectedFolder) { status, message, folder in
                guard let folderDeleted = folder else { return }
                if let index = folders.firstIndex(of: folderDeleted) {
                    folders.remove(at: index)
                }
                self.toastMessage = message
                self.toastStatus = status
                isShowToast.toggle()
            }
        }
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
    }
}
