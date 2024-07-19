//
//  HomeView+SheetCreateFolder.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI

extension HomeView {
    func makeSheetCreateFolder() -> some View {
        CreateFolderView(
            isPresentSheet: $isPresentCreateFolder,
            eventType: .add
        ) {  status, message, newFolder in
            self.toastMessage = message
            self.toastStatus = status
            if let newFolder = newFolder {
                folders.insert(newFolder, at: 0)
            }
            isShowToast.toggle()
            isPresentCreateFolder.toggle()
        }
        .presentationDetents([.medium])
        .presentationCornerRadius(38)
    }
}
