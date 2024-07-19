//
//  CreateFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import Foundation

class CreateFolderViewModel: ObservableObject {
    
    func handleFolder(
        folder: Folder,
        eventType: EventType,
        completion: @escaping (Status, String, Folder?) -> Void
    ) {
        var termFolder = folder
        let dateFormatter = ISO8601DateFormatter()
        termFolder.publishAt = dateFormatter.string(from: Date())
        switch eventType {
        case .add:
            FirestoreManager.addData(
                collection: AppConstants.foldersCollection,
                document: folder.id.uuidString,
                data: termFolder
            ) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                    completion(.fail, "Pùn!!! Không thể thêm folder", nil)
                } else {
                    print("Document added successfully")
                    completion(.success, "Thêm folder thành công rồi nè, Hí!!!", folder)
                }
            }
        case .update:
            FirestoreManager.updateData(
                collection: AppConstants.foldersCollection,
                document: folder.id.uuidString,
                data: folder
            ) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                    completion(.fail, "Pùn!!! Không thể chính sửa folder", nil)
                } else {
                    print("Document updating successfully")
                    completion(.success, "Chỉnh sửa folder thành công rồi nè, Hí!!!", folder)
                }
            }
        }
    }
}
