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
    @Binding var isShouldRandomWord: Bool
    let handleTapVocabularyCard: (Vocabulary) -> Void

    @State var search = ""
    @State var isPresentCreateFolder = false
    @State var isPresentSearchView = false
    @State var isPresentFavoriteScreen = false
    @State var isPresentStudiedScreen = false
    @State var typeOfFilterState: FilterStateEnum = .all
    @State var isShowPopupLogout = false


    

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                makeHeader()
                    .foregroundStyle(.white)
                makeSearch()
                    .padding(.bottom, 80)
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
    }
}


#Preview {
    HomeView(
        viewModel: .init(),
        vocabularies: .constant(AppConstants.mockVocabularies),
        folders: .constant(AppConstants.mockFolders),
        isShouldRandomWord: .constant(false)
    ) { _ in }
}
