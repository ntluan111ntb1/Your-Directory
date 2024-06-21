//
//  VocabularyEntities.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import Foundation

import Foundation

// MARK: - Response
struct VocabularyEntities: Codable {
    let word: String
    let phonetic: String?
    let phonetics: [Phonetic]?
    let meanings: [Meaning]?
}

// MARK: - Phonetic
struct Phonetic: Codable {
    let text: String?
    let audio: String?
    let sourceUrl: String?
    let license: License?
}

// MARK: - License
struct License: Codable {
    let name: String?
    let url: String?
}

// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String?
    let definitions: [Definition]?
    let synonyms: [String]?
    let antonyms: [String]?
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let example: String?
}
