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
    @State var isPresentSheet = false

    let userInfor: SignUp
    let layout = [
        GridItem(.flexible(minimum: 80, maximum: 320)),
        GridItem(.flexible(minimum: 80, maximum: 320)),
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
        .ignoresSafeArea(edges: .bottom)
        .frame(
            width: UIScreen.main.bounds.size.width
        )
        .background(LinearGradient(
            colors: [.lightBlue.opacity(0.5), .lightPink.opacity(0.5)],
            startPoint: .leading,
            endPoint: .trailing)
        )
        .sheet(isPresented: $isPresentSheet, content: {
            CreateVocabularyView(isPresentSheet: $isPresentSheet)
            .presentationDetents([.medium])
            .presentationCornerRadius(38)
        })
    }

    let vocabularys = Vocabularys(vocabularys: [
        Vocabulary(vocabulary: "Description1222222", ipa: "/dɪˈskrɪpʃn/", description: "a piece of writing or speech that says what somebody/something is like; the act of writing or saying in words what somebody/something is like", background: "gra_1"),
        Vocabulary(vocabulary: "Description2", ipa: "/dɪˈskrɪpʃn/", description: "a piece of writing or speech that says what somebody/something is like; the act of writing or saying in words what somebody/something is like", background: "gra_2"),
        Vocabulary(vocabulary: "1221", ipa: "/dɪˈskrɪpʃn/", description: "a piece of writing or speech that says what somebody/something is like; the act of writing or saying in words what somebody/something is like", background: "gra_3"),
        Vocabulary(vocabulary: "Description4", ipa: "/dɪˈskrɪpʃn/", description: "a piece of writing or speech that says what somebody/something is like; the act of writing or saying in words what somebody/something is like", background: "gra_4"),
        Vocabulary(vocabulary: "Description5", ipa: "/dɪˈskrɪpʃn/", description: "a piece of writing or speech that says what somebody/something is like; the act of writing or saying in words what somebody/something is like", background: "gra_5")
    ])
}

#Preview {
    HomeView(userInfor: SignUp(name: "Luana"))
}
