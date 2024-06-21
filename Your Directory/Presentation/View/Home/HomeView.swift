//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()

    @State var search = ""
    @State var isPresentCreateVocabulary = false
    @State var isPresentSearchView = false
    @State var selectedVocabulary: Vocabulary? = nil

    let userInfor: SignUp

    let layout = [
        GridItem(.flexible(minimum: 120, maximum: 320)),
        GridItem(.flexible(minimum: 120, maximum: 320)),
    ]
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
                .padding(.horizontal, 16)
            makeSearch()
            makeListVocabulary()
            Spacer()
            makeBottomTabBar()
        }
        .onAppear {
            viewModel.getVocabularys()
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
        }, content: { vocabulary in
            VStack {
                if let selectedVocabulary = viewModel.searchVocabulary {
                    DetailVocabularyView(
                        vocabulary: .constant(selectedVocabulary)) {
                            viewModel.searchVocabulary = nil
                        } deteleHandle: {
                        }
                        .presentationDetents([.medium, .large])
                }
            }
        })
//        .sheet(isPresented: $isPresentCreateVocabulary, content: {
//            CreateVocabularyView(isPresentSheet: $isPresentCreateVocabulary) { vocabulary in
//                viewModel.addNewVocabulary(vocabulary: vocabulary)
//                isPresentCreateVocabulary.toggle()
//            }
//            .presentationDetents([.medium])
//            .presentationCornerRadius(38)
//        })
//        .sheet(isPresented: $isPresentSearchView) {
//            DetailVocabularyView(
//                vocabulary: $viewModel.searchVocabulary) {
//                } deteleHandle: {
//                }
//                .presentationDetents([.medium, .large])
//        }
    }
}

#Preview {
    HomeView(userInfor: SignUp(name: "Luana"))
}
