//
//  ContentView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var vocabularies: [Vocabulary]
    @Binding var folders: [Folder]
    
    @State var typeOfVocabularyView: EventType = .add
    @State var isShouldRandomWord = false
    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil
    var body: some View {
        TabView {
            HomeView(
                viewModel: viewModel,
                vocabularies: $vocabularies,
                folders: $folders,
                isShouldRandomWord: $isShouldRandomWord
            ) { selectedVocabulary in
                handleTapVocabularyCard(selectedVocabulary)
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            FavoriteVocabulariesView(vocabularies: $vocabularies) { selectedVocabulary in
                handleTapVocabularyCard(selectedVocabulary)
            }
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorite")
                }
            StudiedVocabulariesView(vocabularies: $vocabularies) { selectedVocabulary in
                handleTapVocabularyCard(selectedVocabulary)
            }
                .tabItem {
                    Image(systemName: "text.book.closed")
                    Text("Studied")
                }
        }
        .frame(width: UIScreen.main.bounds.size.width)
        .sheet(item: $viewModel.vocabulary, onDismiss: {
            viewModel.vocabulary = nil
            typeOfVocabularyView = .add
        }, content: { vocabulary in
            makeDetailVocabulary(vocabulary: vocabulary)
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
    }
}

extension ContentView {
    func handleTapVocabularyCard( _ selectedVocabulary: Vocabulary) {
        viewModel.vocabulary = selectedVocabulary
        typeOfVocabularyView = .update
    }
}
