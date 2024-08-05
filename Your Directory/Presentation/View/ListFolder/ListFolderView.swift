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
    @State var selectedFolfer = Folder(name: "", color: "", publishAt: "")

    @Binding var folders: [Folder]
    @Binding var vocabularies: [Vocabulary]

    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Danh Sách Folder")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 32)
            .padding(.bottom)
            .background {
                ConvertColor.colorFromHex("5b5450").clipShape(RoundedCornersShape(
                    corners: [.bottomLeft], radius: 40
                ))
                .ignoresSafeArea()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(folders) { folder in
                        HStack {
                            FolderCardView(folder: folder, vocabularyByFolder: viewModel.getVocabularyByFolder(vocabularies: vocabularies, folder: folder)
                            )
                            VStack {
                                ButtonIcon(
                                    iconsName: "square.and.pencil.circle",
                                    size: .title2,
                                    color: ConvertColor.colorFromHex("FD841F")
                                ) {
                                    selectedFolfer = folder
                                    isUpdateFolder = true
                                }
                                Spacer()
                                ButtonIcon(
                                    iconsName: "trash.circle", 
                                    size: .title2,
                                    color: ConvertColor.colorFromHex("CF0A0A")
                                ) {
                                    selectedFolfer = folder
                                    isShowPopupDetele = true
                                }
                            }
                            .padding(8)
                            .background(ConvertColor.colorFromHex("EDEDED").clipShape(
                                RoundedCornersShape(
                                    corners: .allCorners,
                                    radius: 20
                                )
                            ))
                        }
                    }
                }
                .padding()
            }
        }
        .background {
            Color.background
        }
        .sheet(isPresented: $isUpdateFolder, content: {
            CreateFolderView(
                isPresentSheet: $isUpdateFolder,
                folder: selectedFolfer,
                selectedColor: .style1,
                eventType: .update
            ) { status, message, folder in
                if let folderUpdated = folder {
                    self.selectedFolfer.name = folderUpdated.name
                    self.selectedFolfer.color = folderUpdated.color
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
            detailFolderViewModel.deleteFolder(folder: selectedFolfer) { status, message, folder in
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
