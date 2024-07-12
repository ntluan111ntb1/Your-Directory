//
//  Vocabulary.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation

struct Vocabulary: Codable, Identifiable, Equatable {
    static func == (lhs: Vocabulary, rhs: Vocabulary) -> Bool {
        lhs.id == rhs.id
        && lhs.word == rhs.word
    }

    var id = UUID()
    var word: String
    var phonetics: String
    var audio: String
    var descriptions: [Definition]
    var partOfSpeech: String
    var folder: Folder?
    var vocabularyNote: String?
    var publishAt: String

    struct Definition: Codable {
        let definition: String?
        let example: String?
    }

    var publishDate: Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: publishAt)
    }
}
