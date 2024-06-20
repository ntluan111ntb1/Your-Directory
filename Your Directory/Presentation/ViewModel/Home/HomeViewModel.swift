//
//  HomeViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var userInfor = SignUp(name: "name")
    @Published var vocabularys = Vocabularys(vocabularys: [])

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

    func setVocabulary(vocabulary: Vocabulary) {
        vocabularys.vocabularys.append(vocabulary)
        setDateLocal.setData(key: Keys.vocabularys, object: vocabularys)
    }
}
