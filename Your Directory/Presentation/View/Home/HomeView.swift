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
    @State var isPresentDetailVocabulary = false
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
        .sheet(isPresented: $isPresentCreateVocabulary, content: {
            CreateVocabularyView(isPresentSheet: $isPresentCreateVocabulary) { vocabulary in
                viewModel.setVocabulary(vocabulary: vocabulary)
                isPresentCreateVocabulary.toggle()
            }
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
        .sheet(item: $selectedVocabulary, content: { vocabulary in
            VStack {
                Text(vocabulary.vocabulary)
                Text(vocabulary.ipa)
                Text(vocabulary.description)
            }
            .presentationDetents([.medium, .large])
        })
    }
}

#Preview {
    HomeView(userInfor: SignUp(name: "Luana"))
}
