//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI
import GoogleSignIn
import ExytePopupView

enum FilterStateEnum {
    case all
    case favorite
    case studied
}

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
    @State var isShouldRandomWord = false
    @State var typeOfVocabularyView: EventType = .add
    @State var typeOfFilterState: FilterStateEnum = .all

    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                makeHeader()
                    .foregroundStyle(.white)
                makeSearch()
                makeListFolder()
                    .padding(.vertical, 12)
                    .background {
                        Color.white
                            .clipShape(RoundedCornersShape(corners: .allCorners, radius: 64))
                            .opacity(0.7)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 64)
            }
            .background(
                Image("bg_home_header")
                    .resizable()
                    .clipShape(
                        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 40)
                    )
                    .ignoresSafeArea()
            )
            .overlay(alignment: .bottom, content: {
                RandomWordCard(vocabulary: viewModel.randomWords ?? AppConstants.vocabulary) {
                    viewModel.getRandomWords()
                }
                .onTapGesture {
                    viewModel.vocabulary = viewModel.randomWords
                    isShouldRandomWord = true
                }
                .offset(y: 80)
            })
            .padding(.bottom)
            .zIndex(1)
            VStack(spacing: 16) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        makeListVocabulary()
                    }
                    .padding(.top, 80)
                }
            }
            .zIndex(0)
        }
        .frame(width: UIScreen.main.bounds.size.width)
        .sheet(item: $viewModel.vocabulary, onDismiss: {
            viewModel.vocabulary = nil
            typeOfVocabularyView = .add
        }, content: { vocabulary in
            makeSheetVocabulary(vocabulary: vocabulary)
        })
        .sheet(isPresented: $isPresentCreateFolder) {
            makeSheetCreateFolder()
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
                vocabularies: $vocabularies,
                folders: $folders
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
