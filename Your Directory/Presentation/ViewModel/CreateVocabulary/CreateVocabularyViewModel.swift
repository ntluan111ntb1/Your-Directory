//
//  CreateVocabularyViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation

class CreateVocabularyViewModel: ObservableObject {
    @Published var vocabularys: Vocabularys?

    let setDateLocal = SetDataLocal()

    func setVocabulary(vocabulary: Vocabulary) {
        vocabularys?.vocabularys.append(vocabulary)
        setDateLocal.setData(key: Keys.vocabularys, object: vocabularys)
    }
}
