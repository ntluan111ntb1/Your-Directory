//
//  FavoriteVocabulariesView+Navigation.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

extension FavoriteVocabulariesView {
    func makeNavigation() -> some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 24))
            }
            Spacer()
            Text("Từ Vựng Yêu Thích")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .shadow(radius: 4)
        }
        .padding(.horizontal)
    }
}
