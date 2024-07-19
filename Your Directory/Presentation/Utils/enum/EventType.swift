//
//  TypeOfVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 17/07/2024.
//

import Foundation

enum EventType {
    case add
    case update

    var textButton: String {
        switch self {
        case .update:
            return "Chỉnh Sửa"
        case .add :
            return "Thêm Từ Này"
        }
    }
}
