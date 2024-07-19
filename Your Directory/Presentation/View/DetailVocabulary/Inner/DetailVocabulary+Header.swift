//
//  DetailVocabulary+Header.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/07/2024.
//

import SwiftUI

extension DetailVocabularyView {
    func makeHeader() -> some View {
        HStack {
            if typeOfView == .update {
                Button(action: {
                    isShowPopupDelete = true
                }, label: {
                    Image(systemName: "trash")
                        .font(.title2)
                })
                Spacer()
            }
            Text("Chi tiết từ vựng")
                .fontStyle(.largeBold)
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
            }
        }
        .padding(.horizontal)
    }
}
