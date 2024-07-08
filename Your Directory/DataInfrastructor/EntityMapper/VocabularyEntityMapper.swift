//
//  VocabularyEntityMapper.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import Foundation

struct VocabularyEntityMapper {
    static func map(entity: VocabularyEntities) -> Vocabulary {
        Vocabulary(
            word: entity.word,
            phonetics: (entity.phonetic ?? (entity.phonetics?.first(where: { phonetic in
                phonetic.text != nil
            })?.text)) ?? "",
            audio: (entity.phonetics?.first(where: { phonetic in
                phonetic.audio != nil
            })?.audio) ?? "",
            descriptions: entity.meanings?.first?.definitions?.map({ definition in
                Vocabulary.Definition(definition: definition.definition, example: definition.example)
            }) ?? [],
            partOfSpeech: entity.meanings?.first?.partOfSpeech ?? "",
            category: nil,
            vocabularyNote: nil
        )
    }
}
