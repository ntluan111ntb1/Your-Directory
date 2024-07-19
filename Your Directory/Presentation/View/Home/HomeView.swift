//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI
import GoogleSignIn
import ExytePopupView

struct HomeView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    let user = GIDSignIn.sharedInstance.currentUser

    @ObservedObject var viewModel: HomeViewModel

    @Binding var vocabularies: [Vocabulary]
    @Binding var folders: [Folder]

    @State var search = ""
    @State var isPresentCreateFolder = false
    @State var isPresentSearchView = false
    @State var isShowPopupLogout = false
    @State var typeOfVocabularyView: TypeOfVocabularyView = .search

    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil

    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
            makeSearch()
            makeListFolder()
            makeListVocabulary()
            Spacer()
            makeBottomTabBar()
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(
            width: UIScreen.main.bounds.size.width
        )
        .background(Color.background)
        .sheet(item: $viewModel.vocabulary, onDismiss: {
            viewModel.vocabulary = nil
        }, content: { vocabulary in
            VStack {
                NavigationStack {
                    DetailVocabularyView(
                        vocabulary: .constant(vocabulary),
                        folders: .constant(folders),
                        note: vocabulary.vocabularyNote ?? "",
                        selectedFolder: (vocabulary.folder ?? folders.first) ?? Folder(name: "", color: "", publishAt: ""),
                        typeOfView: typeOfVocabularyView,
                        dismiss: {
                            viewModel.vocabulary = nil
                        }
                    ) { toastStatus, toastMessage, vocabulary in
                        self.toastMessage = toastMessage
                        self.toastStatus = toastStatus
                        switch typeOfVocabularyView {
                        case .search:
                            guard let newVocabulary = vocabulary else { return }
                            vocabularies.insert(newVocabulary, at: 0)
                        case .detail:
                            guard let vocabulry = viewModel.vocabulary else { return }
                            if let index = self.vocabularies.firstIndex(of: vocabulry) {
                                if let vocabularyUpdated = vocabulary {
                                    self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                                    self.vocabularies[index].folder = vocabularyUpdated.folder
                                } else {
                                    self.vocabularies.remove(at: index)
                                }
                            }
                        }
                        viewModel.vocabulary = nil
                        isShowToast = true
                    }
                }
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .sheet(isPresented: $isPresentCreateFolder) {
            CreateFolderView(
                isPresentSheet: $isPresentCreateFolder
            ) {  status, message, newFolder in
                self.toastMessage = message
                self.toastStatus = status
                if let newFolder = newFolder {
                    folders.insert(newFolder, at: 0)
                }
                isShowToast.toggle()
                isPresentCreateFolder.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        }
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
        .popupConfirm(
            isPresented: $isShowPopupLogout,
            image: "question",
            title: "Đăng Xuất ?",
            message: "Bạn có chắc muốn đăng xuất hong?",
            textButtonAgree: "Đăng xuất",
            textButtonCancel: "Thôi"
        ) {
            authenticationViewModel.signOut()
        }
        .navigationDestination(for: Folder.self) { folder in
            DetailFolderView(
                folder: $viewModel.selectedFolder,
                vocabularys: vocabularies
            ) { status, message, folder in
                guard let folderDeleted = folder else { return }
                if let index = folders.firstIndex(of: folderDeleted) {
                    folders.remove(at: index)
                }
                self.toastMessage = message
                self.toastStatus = status
                isShowToast.toggle()
            }
        }
    }
}


#Preview {
    HomeView(
        viewModel: .init(),
        vocabularies: .constant(AppConstants.mockVocabularies),
        folders: .constant(AppConstants.mockFolders)
    )
}
