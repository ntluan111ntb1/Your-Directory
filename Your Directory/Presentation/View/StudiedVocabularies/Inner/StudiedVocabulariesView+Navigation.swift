//
//  StudiedVocabulariesView+Navigation.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension StudiedVocabulariesView {
    func makeNavigation() -> some View {
        HStack {
            Text("Từ Vựng Đã Học")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .shadow(radius: 4)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

