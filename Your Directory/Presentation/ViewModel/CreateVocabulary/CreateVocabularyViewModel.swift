//
//  CreateCategoryViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation

class CreateCategoryViewModel: ObservableObject {
    @Published var categorys: Categorys?

    let setDateLocal = SetDataLocal()

    func setCategory(category: Category) {
        categorys?.categorys.append(category)
        setDateLocal.setData(key: Keys.categorys, object: categorys)
    }
}
