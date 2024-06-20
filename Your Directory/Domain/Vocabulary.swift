//
//  Vocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation

struct Vocabulary: Codable, Identifiable {
    let id = UUID()
    var vocabulary: String
    var ipa: String
    var description: String
    var background: String
}
