//
//  HomeViewInner.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

extension HomeView {
    func makeHeader() -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0){
                    Text("Hi, ")
                        .fontStyle(.largeBold)
                    Text("\(user?.profile?.name ?? "")")
                        .fontStyle(.largeBold)
                        .foregroundStyle(Color.yellowCustome)
                }
                Text("Chào mừng bạn trở lại.")
            }
            Spacer()
            Menu {
                Button {
                    isShowPopupLogout = true
                } label: {
                    Text("Logout")
                }
            } label: {
                NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                    .scaledToFill()
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)
    }
}

