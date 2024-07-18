//
//  Folder.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import Foundation

struct Folder: Codable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var color: String
    var publishAt: String

    var publishDate: Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: publishAt)
    }

    var isEmpty: Bool {
        return name.isEmpty || color.isEmpty
    }
}
