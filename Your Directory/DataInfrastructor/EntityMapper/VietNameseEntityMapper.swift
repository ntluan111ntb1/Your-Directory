//
//  VietNameseEntityMapper.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/08/2024.
//

import Foundation

struct VietNameseEntityMapper {
    static func map(entity: VietNameseEntities) -> VietNamese {
        VietNamese(
            sentences: entity.sentences.map {
                VietNamese.Sentences(trans: $0.trans, orig: $0.orig, backend: $0.backend)
            },
            src: entity.src
        )
    }
}
