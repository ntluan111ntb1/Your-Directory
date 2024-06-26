//
//  Category.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import Foundation
import CoreData

struct Category: Codable, Identifiable {
    var id = UUID()
    var name: String
    var color: String
    
    func toEntity(context: NSManagedObjectContext) -> CategoryEntity {
        let entity = CategoryEntity(context: context)
        entity.name = self.name
        entity.id = self.id
        entity.color = self.color
        return entity
    }
}
