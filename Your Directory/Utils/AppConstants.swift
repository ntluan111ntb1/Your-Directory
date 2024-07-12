//
//  AppConstants.swift
//  Your Directory
//
//  Created by LuanNT29 on 04/07/2024.
//

import Foundation

struct AppConstants {
    static let foldersCollection = "folders"
    static let vocabularysCollection = "vocabularys"

    static let mockVocabularies = [
        Vocabulary(word: "Play", phonetics: "pleɪ", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "FFE9D0"), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "custom", phonetics: "ˈkʌstəm", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "FFFED3"), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "shape", phonetics: "ʃeɪp", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "BBE9FF"), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "draws", phonetics: "drɔːz", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "B1AFFF"), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "triangles", phonetics: "ˈtraɪæŋɡəlz", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "D8EFD3"), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "same", phonetics: "seɪm", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "95D2B3"), vocabularyNote: nil, publishAt: "")
    ]
}
