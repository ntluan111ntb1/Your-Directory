//
//  ListFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/07/2024.
//

import Foundation
class ListFolderViewModel: ObservableObject {
    @Published var folders = [Folder]()
    @Published var isLoading = false

    func getFolders() {
        isLoading = true
        FirestoreManager.fetchData(
            collection: AppConstants.foldersCollection
        ) {
            (folders: [Folder]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let folders = folders else {
                    return
                }
                self.folders = folders.sorted(by: { folder1, folder2 -> Bool in
                    guard let date1 = folder1.publishDate, let date2 = folder2.publishDate else {
                        return false
                    }
                    return date1 > date2
                })
            }
            DispatchQueue.main.asyncAfterUnsafe(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
    }

    func getVocabularyByFolder(vocabularies: [Vocabulary], folder: Folder) -> [Vocabulary] {
        return vocabularies.filter({ vocabulary in
            vocabulary.folderId == folder.id
        })
    }
}
