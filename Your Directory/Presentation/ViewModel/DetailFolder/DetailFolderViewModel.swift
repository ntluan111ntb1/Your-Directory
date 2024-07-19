//
//  DetailFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 11/07/2024.
//

import Foundation

class DetailFolderViewModel: ObservableObject {
    @Published var vocabularies = [Vocabulary]()

    func filterVocabulariesByFolder(vocabularies: [Vocabulary], folderId: UUID) {
        self.vocabularies = vocabularies.filter { vocabulary in
            return vocabulary.folder?.id == folderId
        }
    }

    func deleteFolder(folder: Folder, completion: @escaping (Status, String, Folder?) -> Void) {
        FirestoreManager.deleteData(
            collection: AppConstants.foldersCollection,
            document: folder.name
        ) { error in
            if let error = error {
                print("Error delete document: \(error)")
                completion(.fail, "Pùn!!! Không thể xóa folder", nil)
            } else {
                completion(.success, "Xóa folder thành công rồi nè, Hí!!!", folder)
            }

        }
    }
}
