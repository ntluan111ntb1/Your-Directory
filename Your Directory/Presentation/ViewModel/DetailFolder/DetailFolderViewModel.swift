//
//  DetailFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 11/07/2024.
//

import Foundation

class DetailFolderViewModel: ObservableObject {
    @Published var vocabularys = [Vocabulary]()
    @Published var isRemoveFolder = false

    func getVocabulary(vocabularys: [Vocabulary], folderId: UUID) {
        self.vocabularys = vocabularys.filter { vocabulary in
            return vocabulary.folder?.id == folderId
        }
    }

    func removeFolder() {
        isRemoveFolder.toggle()
    }
}
