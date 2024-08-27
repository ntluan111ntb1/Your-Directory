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
    static let vocabulary = Vocabulary(
        word: "Play",
        phonetics: "pleɪ",
        audio: "",
        descriptions: [Vocabulary.Definition.init(
            definition: "Similar activity in young animals, as they explore their environment and learn new skills.", 
            example: nil
        )],
        partOfSpeech: "",
        folderId: uuid1,
        vocabularyNote: nil,
        publishAt: ""
    )
    static let mockVocabularies = [
        Vocabulary(
            word: "Play",
            phonetics: "pleɪ",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid1,
            vocabularyNote: nil,
            publishAt: "",
            isStudy: true
        ),
        Vocabulary(
            word: "custom",
            phonetics: "ˈkʌstəm",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid1,
            vocabularyNote: nil,
            publishAt: ""
        ),
        Vocabulary(
            word: "shape",
            phonetics: "ʃeɪp",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid1,
            vocabularyNote: nil,
            publishAt: "",
            isStudy: true,
            isFavorite: true
        ),
        Vocabulary(
            word: "draws",
            phonetics: "drɔːz",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid2,
            vocabularyNote: nil,
            publishAt: "",
            isStudy: true
        ),
        Vocabulary(
            word: "triangles",
            phonetics: "ˈtraɪæŋɡəlz",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid2,
            vocabularyNote: nil,
            publishAt: ""
        ),
        Vocabulary(
            word: "same",
            phonetics: "seɪm",
            audio: "",
            descriptions: [],
            partOfSpeech: "",
            folderId: uuid2,
            vocabularyNote: nil,
            publishAt: ""
        )
    ]
    static let mockFolders = [
        Folder(id: uuid1, name: "hihi", color: "405D72", publishAt: ""),
        Folder(id: uuid2, name: "haha", color: "667BC6", publishAt: ""),
        Folder(name: "hihihi", color: "153448", publishAt: ""),
        Folder(name: "hehe", color: "124076", publishAt: ""),
        Folder(name: "hoho", color: "0E5E6F", publishAt: "")
    ]
}
