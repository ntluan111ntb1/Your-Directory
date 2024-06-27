//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @StateObject var categoryViewModel: CreateCategoryViewModel

    @State var search = ""
    @State var isPresentCreateCategory = false
    @State var isPresentSearchView = false
    @State var selectedVocabulary: Vocabulary? = nil
    @State var selectedCategory: Category? = nil
    let userInfor: SignUp

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(context: NSManagedObjectContext) {
        _categoryViewModel = StateObject(wrappedValue: CreateCategoryViewModel(context: context))
    }
    
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
//            viewModel.getCategorys(context: viewContext)
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
                DetailVocabularyView(
                    vocabulary: .constant(searchVocabulary),
                    textButton: "Thêm từ này"
                ) {
                    viewModel.searchVocabulary = nil
                } addVocabulary: { note in
                    viewModel.addNewVocabulary(note: note)
                    viewModel.searchVocabulary = nil
                }
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .sheet(item: $selectedVocabulary, content: { selectedContent in
            DetailVocabularyView(
                vocabulary: .constant(selectedContent), textButton: "Xóa từ này") {
                    selectedVocabulary = nil
                } deleteVocabulary: {
                    viewModel.deleteVocabulary(vocabulary: selectedContent)
                    selectedVocabulary = nil
                }
                .presentationDetents([.medium, .large])
                .presentationCornerRadius(38)
        })
        .sheet(isPresented: $isPresentCreateCategory, content: {
            CreateCategoryView(isPresentSheet: $isPresentCreateCategory)
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
//        .sheet(item: $selectedCategory, content: { selectedContent in
//            DetailCategoryVIew(category: .constant(selectedContent))
//                .presentationDetents([.medium, .large])
//                .presentationCornerRadius(38)
//        })
    }
}

#Preview {
    HomeView(
        context: PersistenceController.preview.container.viewContext,
        userInfor: SignUp(name: "Luana")
    )
}
