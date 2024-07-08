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

    @Published var vocabularys = Vocabularys(vocabularys: [])
    @Published var categorys = Categorys(categorys: [])
    @Published var searchVocabulary: Vocabulary?

    let firestoreManager = FirestoreManager()

    func getVocabularys() {
        let collectionPath = ""
        firestoreManager.fetchData(
            collectionPath: collectionPath,
            document: AppConstants.vocabularysDocument
        ) {
            (vocabularys: Vocabularys?, error) in
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

    func addVocabulary(note: String, category: Category) {
        guard var vocabulary = searchVocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabulary.category = category
        vocabularys.vocabularys.append(vocabulary)
        let collectionPath = ""
        firestoreManager.addData(
            collectionPath: collectionPath,
            document: AppConstants.vocabularysDocument,
            data: vocabularys
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
    
    func getCategorys() {
        let collectionPath = ""
        firestoreManager.fetchData(
            collectionPath: collectionPath,
            document: AppConstants.categorysDocument
        ) {
            (categorys: Categorys?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let categorys = categorys else {
                    return
                }
                self.categorys = categorys
            }
        }
    }
    
    func addNewCategory(category: Category) {
        categorys.categorys.append(category)
        let collectionPath = ""
        firestoreManager.addData(
            collectionPath: collectionPath,
            document: AppConstants.categorysDocument,
            data: categorys
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
