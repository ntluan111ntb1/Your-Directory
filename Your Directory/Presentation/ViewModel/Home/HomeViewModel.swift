//
//  HomeViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()

    @Published var vocabularys = [Vocabulary]()
    @Published var folders = [Folder]()
    @Published var searchVocabulary: Vocabulary?

    let firestoreManager = FirestoreManager()

    func searchVocabulary(vocabulary: String) {
        DirectionHttp.getVocabulary(vocabulary: vocabulary)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("==> error: \(error)")
                }
            } receiveValue: { [self] response in
                searchVocabulary = response
            }
            .store(in: &disposables)
    }
}

// Handle for folder
extension HomeViewModel {
    func getFolders() {
        let collectionPath = ""
        firestoreManager.fetchData(
            collection: AppConstants.foldersCollection
        ) {
            (folders: [Folder]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let folders = folders else {
                    return
                }
                self.folders = folders
            }
        }
    }

    func addFolder(folder: Folder) {
        firestoreManager.addData(
            collection: AppConstants.foldersCollection,
            document: folder.name,
            data: folder
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                self.folders.append(folder)
                print("Document added successfully")
            }
        }
    }

    func deleteFolder(folder: Folder) {
        firestoreManager.deleteData(
            collection: AppConstants.foldersCollection,
            document: folder.name
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                if let index = self.folders.firstIndex(of: folder) {
                    self.folders.remove(at: index)
                } else {
                    print("Can not found \(folder.name)")
                }

                print("remove successfully")
            }

        }
    }
}

// Handle for vocabulary
extension HomeViewModel {
    func getVocabularys() {
        firestoreManager.fetchData(
            collection: AppConstants.vocabularysCollection
        ) {
            (vocabularys: [Vocabulary]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let vocabularys = vocabularys else {
                    return
                }
                self.vocabularys = vocabularys
            }
        }
    }

    func addVocabulary(note: String, folder: Folder) {
        guard var vocabulary = searchVocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabulary.folder = folder
        firestoreManager.addData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word,
            data: vocabulary
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                self.vocabularys.append(vocabulary)
                print("Document added successfully")
            }
        }
    }

    func deleteVocabulary(vocabulary: Vocabulary) {
        firestoreManager.deleteData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                if let index = self.vocabularys.firstIndex(of: vocabulary) {
                    self.vocabularys.remove(at: index)
                } else {
                    print("Can not found \(vocabulary.word)")
                }

                print("remove successfully")
            }

        }
    }
}
