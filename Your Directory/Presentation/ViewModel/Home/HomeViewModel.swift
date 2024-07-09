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
        vocabularys.append(vocabulary)
        firestoreManager.addData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word,
            data: vocabulary
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
    
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
    
    func addNewFolder(folder: Folder) {
        folders.append(folder)
        firestoreManager.addData(
            collection: AppConstants.foldersCollection,
            document: folder.name,
            data: folder
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }

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
    func searchHandle() {
        
    }
}
