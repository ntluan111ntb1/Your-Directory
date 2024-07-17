//
//  HomeView+Search.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

extension HomeView {
    func makeSearch() -> some View {
        HStack {
            GIFView(type: .name("search"))
                .frame(width: 40, height: 40)
                .onTapGesture {
                    viewModel.searchVocabulary(vocabulary: search)
                }
            TextField("Bạn muốn tìm từ vựng nào?", text: $search)
                .onSubmit {
                    viewModel.searchVocabulary(vocabulary: search)
                    typeOfVocabularyView = .search
                    isPresentSearchView.toggle()
                }
            Button {
                search = ""
            } label: {
                Image(systemName: "xmark")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 24)
                .fill(.white)
        )
        .padding(.horizontal, 16)
    }
}
