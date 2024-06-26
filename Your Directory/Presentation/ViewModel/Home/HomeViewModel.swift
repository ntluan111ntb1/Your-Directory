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

    @Published var userInfor = SignUp(name: "name")
    @Published var vocabularys = Vocabularys(vocabularys: [])
    @Published var categorys = [Category]()
    @Published var searchVocabulary: Vocabulary?

    let getDataLocal = GetDataLocal()
    let setDateLocal = SetDataLocal()

    func getUserInfor() {
        guard let userInfor = getDataLocal.getData(key: Keys.userInfor, objectType: SignUp.self) else {return}
        self.userInfor = userInfor
    }

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
        guard let categorys = getDataLocal.getData(
            key: Keys.categorys,
            objectType: [Category].self
        ) else {return}
        self.categorys = categorys
    }
    
    func addNewCategory(category: Category) {
        categorys.append(category)
        setDateLocal.setData(key: Keys.categorys, object: categorys)
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
