//
//  CategoryEntity.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 26/06/2024.
//

import Foundation
import CoreData


class CategoryEntity: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var name: String
    @NSManaged var color: String
}
