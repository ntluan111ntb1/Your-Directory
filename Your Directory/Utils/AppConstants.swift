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
    static let uuid1 = UUID()
    static let uuid2 = UUID()
    static let mockVocabularies = [
        Vocabulary(word: "Play", phonetics: "pleɪ", audio: "", descriptions: [], partOfSpeech: "", folderId: uuid1, vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "custom", phonetics: "ˈkʌstəm", audio: "", descriptions: [], partOfSpeech: "", folderId: uuid1, vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "shape", phonetics: "ʃeɪp", audio: "", descriptions: [], partOfSpeech: "", folderId: uuid1, vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "draws", phonetics: "drɔːz", audio: "", descriptions: [], partOfSpeech: "", folderId: uuid2, vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "triangles", phonetics: "ˈtraɪæŋɡəlz", audio: "", descriptions: [], partOfSpeech: "", folderId: UUID(), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "same", phonetics: "seɪm", audio: "", descriptions: [], partOfSpeech: "", folderId: uuid2, vocabularyNote: nil, publishAt: "")
    ]

    static let mockFolders = [
        Folder(id: uuid1, name: "hihi", color: "FFE9D0", publishAt: ""),
        Folder(id: uuid2, name: "haha", color: "FFFED3", publishAt: ""),
        Folder(name: "hihihi", color: "BBE9FF", publishAt: ""),
        Folder(name: "hehe", color: "B1AFFF", publishAt: ""),
        Folder(name: "hoho", color: "D8EFD3", publishAt: "")
    ]
}
