//
//  CreateFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import Foundation

class CreateFolderViewModel: ObservableObject {
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
}
