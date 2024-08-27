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
            ButtonImage(name: "home", size: 44) {
                bottomTabBarState = .home
            }
            .padding(.bottom, 16)
            Spacer()
            ButtonImage(name: "folder", size: 40) {
                bottomTabBarState = .listFolder
            }
                .padding(.bottom, 16)
            Spacer()
        }
    }
}
