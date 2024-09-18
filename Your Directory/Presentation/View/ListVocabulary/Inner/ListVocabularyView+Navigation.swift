//
//  ListVocabularyView+Navigation.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/09/2024.
//

import SwiftUI

extension ListVocabularyView {
    func makeNavigation() -> some View {
        HStack {
            Text("Tất Cả Từ Vựng")
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
