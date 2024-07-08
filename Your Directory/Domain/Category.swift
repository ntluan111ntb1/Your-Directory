//
//  Category.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import Foundation

struct Category: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var color: String
}
