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
    @State var selectedVocabulary: Vocabulary? = nil

    // Toast
    @State var isShowToast = false
    @State var message: String? = nil
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
        .sheet(item: $viewModel.searchVocabulary, onDismiss: {
            viewModel.searchVocabulary = nil
        }, content: { searchVocabulary in
            VStack {
                NavigationStack {
                    DetailVocabularyView(
                        vocabulary: .constant(searchVocabulary),
                        folders: .constant(viewModel.folders),
                        textButton: "Thêm từ này"
                    ) {
                        viewModel.searchVocabulary = nil
                    } addVocabulary: { note, folder in
                        viewModel.addVocabulary(note: note, folder: folder) { status, message in
                            self.message = message
                            self.toastStatus = status
                            isShowToast.toggle()
                        }
                        viewModel.searchVocabulary = nil
                    }
                }
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .sheet(item: $selectedVocabulary, content: { selectedContent in
            DetailVocabularyView(
                vocabulary: .constant(selectedContent), 
                folders: .constant(viewModel.folders),
                textButton: "Xóa từ này") {
                    selectedVocabulary = nil
                } deleteVocabulary: {
                    viewModel.deleteVocabulary(vocabulary: selectedContent) { status, message in
                        self.message = message
                        self.toastStatus = status
                        isShowToast.toggle()
                    }
                    selectedVocabulary = nil
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
