//
//  ContentView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI
enum TabbedItems: CaseIterable {
    case home
    case favorite
    case studied

    var imageDefault: String {
        switch self {
        case .home:
            "ic_tabar_home"
        case .favorite:
            "ic_tabar_favorite"
        case .studied:
            "ic_tabar_studied"
        }
    }

    var imageSelected: String {
        switch self {
        case .home:
            "ic_selected_tabar_home"
        case .favorite:
            "ic_selected_tabar_favorite"
        case .studied:
            "ic_selected_tabar_studied"
        }
    }

    var label: String {
        switch self {
        case .home:
            "Home"
        case .favorite:
            "Favorite"
        case .studied:
            "Studied"
        }
    }
}
struct ContentView: View {

    @StateObject var viewModel = HomeViewModel()
    @StateObject var listVocabularyViewModel = ListVocabularyViewModel()

    @State var folders = [Folder]()

    @State var typeOfVocabularyView: EventType = .add
    @State var isShouldRandomWord = false
    @State var selectedTab: TabbedItems = .home
    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(
                    viewModel: viewModel,
                    vocabularies: $listVocabularyViewModel.vocabularys,
                    folders: $folders,
                    isShouldRandomWord: $isShouldRandomWord
                ) { selectedVocabulary in
                    handleTapVocabularyCard(selectedVocabulary)
                }
                .tag(TabbedItems.home)
                FavoriteVocabulariesView(vocabularies: $listVocabularyViewModel.vocabularys) { selectedVocabulary in
                    handleTapVocabularyCard(selectedVocabulary)
                }
                .tag(TabbedItems.favorite)
                StudiedVocabulariesView(vocabularies: $listVocabularyViewModel.vocabularys) { selectedVocabulary in
                    handleTapVocabularyCard(selectedVocabulary)
                }
                .tag(TabbedItems.studied)
            }
            HStack {
                ForEach(TabbedItems.allCases, id: \.self) { item in
                    HStack {
                        Spacer()
                        TabBarItem(
                            text: item.label,
                            imageDefault: item.imageDefault, 
                            imageSelected: item.imageSelected,
                            isSelected: selectedTab == item
                        ) {
                            selectedTab = item
                        }
                        Spacer()
                    }
                    .padding(.top, 16)
                }
            }
            .frame(height: 70)
        }
        .sheet(item: $viewModel.vocabulary, onDismiss: {
            viewModel.vocabulary = nil
            typeOfVocabularyView = .add
        }, content: { vocabulary in
            makeDetailVocabulary(vocabulary: vocabulary)
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
        .onAppear {
            listVocabularyViewModel.getVocabularys()
        }
    }
}

extension ContentView {
    func handleTapVocabularyCard( _ selectedVocabulary: Vocabulary) {
        viewModel.vocabulary = selectedVocabulary
        typeOfVocabularyView = .update
    }
}

#Preview {
    ContentView()
}
