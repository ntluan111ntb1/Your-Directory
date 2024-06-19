//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    let userInfor: SignUp
    
    @State var isPresentSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            makeHeader()
                .padding(.horizontal, 16)
            Spacer()
            makeBottomTabBar()
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(
            width: UIScreen.main.bounds.size.width
        )
        .background(LinearGradient(
            colors: [.lightBlue, .lightPink],
            startPoint: .leading,
            endPoint: .trailing)
        )
        .sheet(isPresented: $isPresentSheet, content: {
            CreateVocabularyView()
            .presentationDetents([.medium])
        })
    }
}

#Preview {
    HomeView(userInfor: SignUp(name: "Luana"))
}
