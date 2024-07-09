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
    @State var isPresentCreateCategory = false
    @State var isPresentSearchView = false
    @State var selectedVocabulary: Vocabulary? = nil
    @State var selectedCategory: Folder? = nil

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
                .padding(.horizontal, 16)
            makeSearch()
            makeListCategory()
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
        .background(LinearGradient(
            colors: [.lightBlue.opacity(0.5), .lightPink.opacity(0.5)],
            startPoint: .leading,
            endPoint: .trailing)
        )
        .sheet(item: $viewModel.searchVocabulary, onDismiss: {
            viewModel.searchVocabulary = nil
        }, content: { searchVocabulary in
            VStack {
                NavigationStack {
                    DetailVocabularyView(
                        vocabulary: .constant(searchVocabulary),
                        categorys: .constant(viewModel.folders),
                        textButton: "Thêm từ này"
                    ) {
                        viewModel.searchVocabulary = nil
                    } addVocabulary: { note, category in
                        viewModel.addVocabulary(note: note, category: category)
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
                categorys: .constant(viewModel.folders),
                textButton: "Xóa từ này") {
                    selectedVocabulary = nil
                } deleteVocabulary: {
                    selectedVocabulary = nil
                }
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(38)
        })
        .sheet(isPresented: $isPresentCreateCategory, content: {
            CreateCategoryView(isPresentSheet: $isPresentCreateCategory) { category in
                viewModel.addNewCategory(category: category)
                isPresentCreateCategory.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
        .sheet(item: $selectedCategory, content: { selectedContent in
            DetailCategoryVIew(category: .constant(selectedContent))
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(38)
        })
    }
}

#Preview {
    HomeView()
}
