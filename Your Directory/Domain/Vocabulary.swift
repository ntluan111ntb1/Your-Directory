//
//  Vocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation

struct Vocabulary: Codable, Identifiable {
    let id = UUID()
    var word: String
    var phonetics: String
    var audio: String
    var descriptions: [Definition]
    var partOfSpeech: String
    var vocabularyNote: String?

    struct Definition: Codable {
        let definition: String?
        let example: String?
    }
}

