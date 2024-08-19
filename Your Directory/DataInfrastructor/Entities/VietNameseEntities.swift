//
//  VietNameseEntities.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/08/2024.
//

import Foundation

struct VietNameseEntities: Codable {
    let sentences: [Sentences]
    let src: String
    let spell: [String: String]

    struct Sentences: Codable {
        let trans: String
        let orig: String
        let backend: Int
    }
}
