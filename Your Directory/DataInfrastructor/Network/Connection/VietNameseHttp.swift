//
//  VietNameseHttp.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/08/2024.
//

import Foundation
import Combine

final class VietNameseHttp {

    static func getVietNamese(word: String) -> AnyPublisher<VietNamese, NetworkError> {
        guard let baseUrl = URL(string: "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=vi&dt=t&dj=1&ie=UTF-8&oe=UTF-8&q=\(word)") else {
            return Fail(error: NetworkError(
                status: 404,
                message: "URL Invalid")
            )
            .eraseToAnyPublisher()
        }
        return AlamofireNetworkService.shared.fetchData(baseUrl: baseUrl)
            .flatMap { (response: VietNameseEntities) -> AnyPublisher<VietNamese, NetworkError> in
                let mappedResult = VietNameseEntityMapper.map(entity: response)
                print("=> result: \(mappedResult)")
                return Result.Publisher(mappedResult).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
