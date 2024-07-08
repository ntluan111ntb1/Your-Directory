//
//  CreateCategory+Header.swift
//  Your Directory
//
//  Created by LuanNT29 on 05/07/2024.
//

import SwiftUI

extension CreateCategoryView {
    func makeHeader() -> some View {
        HStack {
            Text("Tạo mới thể loại")
                .fontStyle(.largeBold)
            Spacer()
            Button {
                isPresentSheet.toggle()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal, 16)
    }
}
