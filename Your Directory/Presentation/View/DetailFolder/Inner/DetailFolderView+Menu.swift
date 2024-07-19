//
//  DetailFolderView+Menu.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI

extension DetailFolderView {
    func makeMenu() -> some View {
        Menu {
            Button(action: {
                isUpdateFolder = true
            }) {
                Text("Chỉnh sửa")
                Image(systemName: "pencil")
            }
            Button(action: {
                isShowPopupDetele = true
            }) {
                Text("Xóa")
                Image(systemName: "trash")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}
