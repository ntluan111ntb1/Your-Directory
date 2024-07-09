//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI
import GoogleSignIn

struct HomeView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    let user = GIDSignIn.sharedInstance.currentUser

    @StateObject var viewModel = HomeViewModel()

    @State var search = ""
    @State var isPresentCreateFolder = false
    @State var isPresentSearchView = false
    @State var selectedVocabulary: Vocabulary? = nil
    @State var selectedFolder: Folder? = nil

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
            makeSearch()
            makeListFolder()
            makeListVocabulary()
            Spacer()
            makeBottomTabBar()
        }
        .onAppear {
            viewModel.getVocabularys()
            viewModel.getFolders()
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(
            width: UIScreen.main.bounds.size.width
        )
        .background(ConvertColor.colorFromHex("aebebc"))
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
                        viewModel.addVocabulary(note: note, folder: folder)
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
                    viewModel.deleteVocabulary(vocabulary: selectedContent)
                    selectedVocabulary = nil
                }
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(38)
        })
        .sheet(isPresented: $isPresentCreateFolder, content: {
            CreateFolderView(isPresentSheet: $isPresentCreateFolder) { folder in
                viewModel.addFolder(folder: folder)
                isPresentCreateFolder.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
        .sheet(item: $selectedFolder, content: { selectedContent in
            DetailFolderView(folder: .constant(selectedContent)) {
                viewModel.deleteFolder(folder: selectedContent)
                selectedFolder = nil
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
    }
}

#Preview {
    HomeView()
}
