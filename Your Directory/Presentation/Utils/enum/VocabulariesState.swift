//
//  VocabulariesState.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import Foundation
enum VocabulariesState {
    case all
    case studied
    case notStudied
    case favorited
    case favoriteAndStudied
    case favoriteAndNotStudied

    func vocabularys(from vocabularies: [Vocabulary]) -> [Vocabulary] {
        switch self {
        case .all:
            vocabularies
        case .studied:
            vocabularies.filter { $0.isStudy }
        case .notStudied:
            vocabularies.filter { !$0.isStudy }
        case .favorited:
            vocabularies.filter { $0.isFavorite }
        case .favoriteAndStudied:
            vocabularies.filter{ $0.isFavorite && $0.isStudy }
        case .favoriteAndNotStudied:
            vocabularies.filter{ $0.isFavorite && !$0.isStudy }
        }
    }
}
