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

    @State var search = ""
    @State var isPresentCreateFolder = false
    @State var isPresentSearchView = false
    @State var isShowPopupLogout = false
    @State var typeOfVocabularyView: TypeOfVocabularyView = .search

    // Toast
    @State var isShowToast = false
    @State var message: String? = nil
    @State var toastStatus: Status? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
            makeSearch()
            if viewModel.isLoading {
                LoadingView()
            } else {
                VStack {
                    makeListFolder()
                    makeListVocabulary()
                }
            }
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
        }, content: { searchVocabulary in
            VStack {
                NavigationStack {
                    DetailVocabularyView(
                        vocabulary: .constant(searchVocabulary),
                        folders: .constant(viewModel.folders),
                        note: searchVocabulary.vocabularyNote ?? "",
                        selectedFolder: (searchVocabulary.folder ?? viewModel.folders.first) ?? Folder(name: "", color: "", publishAt: ""),
                        typeOfView: typeOfVocabularyView,
                        dismiss: {
                            viewModel.vocabulary = nil
                        },
                        handleVocabulary: { note, folder in
                            viewModel.handleVocabulary(
                                typeOfHandle: typeOfVocabularyView,
                                note: note,
                                folder: folder
                            ) {
                                status, message in
                                self.message = message
                                self.toastStatus = status
                                isShowToast.toggle()
                            }
                            viewModel.vocabulary = nil
                        },
                        deleteVocabulary: {
                            viewModel.deleteVocabulary(vocabulary: searchVocabulary) { 
                                status, message in
                                self.message = message
                                self.toastStatus = status
                                isShowToast.toggle()
                            }
                            viewModel.vocabulary = nil
                        })
                }
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .sheet(isPresented: $isPresentCreateFolder, content: {
            CreateFolderView(isPresentSheet: $isPresentCreateFolder) { folder in
                viewModel.addFolder(folderName: folder.name, folderColor: folder.color) { status, message in
                    self.message = message
                    self.toastStatus = status
                    isShowToast.toggle()
                }
                isPresentCreateFolder.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
        .popup(isPresented: $isShowToast) {
            ToastView(message: message ?? "", state: toastStatus ?? .fail)
        } customize: {
            $0
                .type(.floater())
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .autohideIn(3)
        }
        .popup(isPresented: $isShowPopupLogout, view: {
            PopupView(
                image: "question",
                title: "Đăng Xuất ?",
                content: "Bạn có chắc muốn đăng xuất hong?",
                textButtonAgree: "Đăng xuất",
                textButtonCancel: "Thôi",
                handleAgree: {
                    authenticationViewModel.signOut()
                },
                handleCancel: {
                    isShowPopupLogout = false
                }
            )
            .padding(.horizontal)
        }, customize: {
            $0
                .type(.floater())
                .position(.bottom)
                .animation(.spring)
                .closeOnTapOutside(true)
        })
        .navigationDestination(for: Folder.self) { folder in
            DetailFolderView(
                folder: $viewModel.selectedFolder,
                vocabularys: viewModel.vocabularys
            ) {
                viewModel.deleteFolder(folder: folder) { status, message in
                    self.message = message
                    self.toastStatus = status
                    isShowToast.toggle()
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}
