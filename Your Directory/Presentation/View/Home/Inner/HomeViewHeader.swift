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
                        .foregroundStyle(Color.orangeCustomize)
                }
                Text("Wellcome back")
            }
            Spacer()
            NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())
                .onTapGesture {
                    authenticationViewModel.signOut()
                }
        }
        .padding(.horizontal, 16)
    }
}

