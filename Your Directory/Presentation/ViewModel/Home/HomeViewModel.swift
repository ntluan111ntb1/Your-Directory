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

    func addVocabulary(note: String, category: Folder) {
        guard var vocabulary = searchVocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabulary.category = category
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
            collection: AppConstants.categorysCollection
        ) {
            (categorys: [Folder]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let categorys = categorys else {
                    return
                }
                self.folders = categorys
            }
        }
    }
    
    func addNewCategory(category: Folder) {
        folders.append(category)
        firestoreManager.addData(
            collection: AppConstants.categorysCollection,
            document: category.name,
            data: category
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
