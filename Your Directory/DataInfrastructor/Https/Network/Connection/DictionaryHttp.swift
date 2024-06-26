//
//  DictionaryHttp.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import Foundation
import Combine

final class DirectionHttp {

    static func getVocabulary(vocabulary: String) -> AnyPublisher<Vocabulary, NetworkError> {
        guard let baseUrl = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(vocabulary)") else {
            return Fail(error: NetworkError(
                status: 404,
                message: "URL Invalid")
            )
            .eraseToAnyPublisher()
        }
        return AlamofireNetworkService.shared.fetchData(baseUrl: baseUrl)
            .flatMap { (response: [VocabularyEntity]) -> AnyPublisher<Vocabulary, NetworkError> in
                let mappedResult = VocabularyEntityMapper.map(entity: response[0])
                return Result.Publisher(mappedResult).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
