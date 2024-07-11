//
//  Folder.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import Foundation

struct Folder: Codable, Identifiable, Hashable {
    let id = UUID()
    var name: String
    var color: String
}
