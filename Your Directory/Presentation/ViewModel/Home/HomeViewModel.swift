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

    let getDataLocal = GetDataLocal()
    let setDateLocal = SetDataLocal()
    let firestoreManager = FirestoreManager()

    func getVocabularys() {
        guard let vocabularys = getDataLocal.getData(
            key: Keys.vocabularys,
            objectType: Vocabularys.self
        ) else {return}
        self.vocabularys = vocabularys
    }

    func addNewVocabulary(note: String) {
        guard var vocabulary = searchVocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabularys.vocabularys.append(vocabulary)
        setDateLocal.setData(key: Keys.vocabularys, object: vocabularys)
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


    func deleteVocabulary(vocabulary: Vocabulary) {
        vocabularys.vocabularys.removeAll(where: { $0.id == vocabulary.id})
        setDateLocal.setData(key: Keys.vocabularys, object: vocabularys)
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
