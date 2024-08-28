//
//  VocabularyStateEnum.swift
//  Your Directory
//
//  Created by LuanNT29 on 27/08/2024.
//

import Foundation
import SwiftUI

enum VocabularyStateEnum {
    case favorite
    case studied
    case new
    case favoriteAndStudie

    var color: Color {
        switch self {
        case .favorite:
            return Color.lightYellowCustome
        case .studied:
            return Color.lightBlueCustome
        case .favoriteAndStudie:
            return Color.lightOrangeCustome
        case .new:
            return Color.lightPurpleCustome
        }
    }

    var icons: String {
        switch self {
        case .favorite:
            return "ic_favorited"
        case .studied:
            return "ic_studied"
        case .favoriteAndStudie:
            return "ic_favorite_and_studied"
        case .new:
            return "ic_new"
        }
    }
}
