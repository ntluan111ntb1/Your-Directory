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
        Vocabulary(word: "Play", phonetics: "pleɪ", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "FFE9D0", publishAt: ""), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "custom", phonetics: "ˈkʌstəm", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "FFFED3", publishAt: ""), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "shape", phonetics: "ʃeɪp", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "BBE9FF", publishAt: ""), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "draws", phonetics: "drɔːz", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "B1AFFF", publishAt: ""), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "triangles", phonetics: "ˈtraɪæŋɡəlz", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "D8EFD3", publishAt: ""), vocabularyNote: nil, publishAt: ""),
        Vocabulary(word: "same", phonetics: "seɪm", audio: "", descriptions: [], partOfSpeech: "", folder: Folder(name: "", color: "95D2B3", publishAt: ""), vocabularyNote: nil, publishAt: "")
    ]

    static let mockFolders = [
        Folder(name: "hihi", color: "FFE9D0", publishAt: ""),
        Folder(name: "haha", color: "FFFED3", publishAt: ""),
        Folder(name: "hihihi", color: "BBE9FF", publishAt: ""),
        Folder(name: "hehe", color: "B1AFFF", publishAt: ""),
        Folder(name: "hoho", color: "D8EFD3", publishAt: "")
    ]
}
