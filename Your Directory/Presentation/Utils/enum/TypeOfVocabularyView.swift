//
//  TypeOfVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/07/2024.
//

import Foundation

enum TypeOfVocabularyView {
    case search
    case detail

    var textButton: String {
        switch self {
        case .detail:
            return "Chỉnh Sửa"
        case .search :
            return "Thêm Từ Này"
        }
    }
}
