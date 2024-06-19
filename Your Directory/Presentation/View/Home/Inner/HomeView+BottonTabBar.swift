//
//  HomeView+BottonTabBar.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

extension HomeView {
    func makeBottomTabBar() -> some View {
        HStack(alignment: .bottom) {
            Spacer()
            ButtonIcons(name: "home", size: 40) { }
            Spacer()
            Button {
                isPresentSheet.toggle()
            } label: {
                Image("button_plus")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            .offset(x:0, y: -30)
            Spacer()
            ButtonIcons(name: "profile", size: 40) { }
            Spacer()
        }
        .background {
            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 24)
                .fill(.white)
                .shadow(radius: 4)
        }
        
    }
}
