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
                Text("Hi,\(userInfor.name)")
                    .fontStyle(.largeBold)
                Text("Wellcome back")
            }
            Spacer()
            Button {
                /// Todo
            } label: {
                VStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                        .clipShape(Circle())
                }
                .frame(width: 52, height: 52)
            }
        }
    }
}

