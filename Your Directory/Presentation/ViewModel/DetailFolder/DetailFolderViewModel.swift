//
//  DetailFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 11/07/2024.
//

import Foundation

class DetailFolderViewModel: ObservableObject {
    @Published var vocabularys = [Vocabulary]()

    func getVocabulary(vocabularys: [Vocabulary], folderId: UUID) {
        self.vocabularys = vocabularys.filter { vocabulary in
            return vocabulary.folder?.id == folderId
        }
    }

    func addFolder(
        folder: Folder,
        completion: @escaping (Status, String, Folder?) -> Void
    ) {
        var newFolder = folder
        let dateFormatter = ISO8601DateFormatter()
        newFolder.publishAt = dateFormatter.string(from: Date())

        FirestoreManager.addData(
            collection: AppConstants.foldersCollection,
            document: newFolder.name,
            data: newFolder
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.fail, "Pùn!!! Không thể thêm folder", nil)
            } else {
                print("Document added successfully")
                completion(.success, "Thêm folder thành công rồi nè, Hí!!!", newFolder)
            }
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
