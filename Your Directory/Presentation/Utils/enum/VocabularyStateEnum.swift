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

    var color: any ShapeStyle {
        switch self {
        case .favorite:
            return Color.lightPinkCustome
        case .new:
            return Color.blueCustome
        case .studied:
            return Color.lightGreenCustome
        }
    }
}
