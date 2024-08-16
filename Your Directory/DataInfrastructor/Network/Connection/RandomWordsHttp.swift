//
//  RandomWordsHttp.swift
//  Your Directory
//
//  Created by LuanNT29 on 09/08/2024.
//

import Foundation
import Combine

final class RandomWordsHttp {

    static func getRandomWords() -> AnyPublisher<RandomWords, NetworkError> {
        guard let baseUrl = URL(string: "https://random-word-api.vercel.app/api") else {
            return Fail(error: NetworkError(
                status: 404,
                message: "URL Invalid")
            )
            .eraseToAnyPublisher()
        }
        return AlamofireNetworkService.shared.fetchData(baseUrl: baseUrl)
            .flatMap { (response: [String]) -> AnyPublisher<RandomWords, NetworkError> in
                let mappedResult = RandomWordsEntityMapper.map(entity: response[0])
                print("=> result: \(mappedResult)")
                return Result.Publisher(mappedResult).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
