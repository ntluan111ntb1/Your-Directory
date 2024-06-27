//
//  CreateCategoryViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import Foundation
import CoreData

class CreateCategoryViewModel: ObservableObject {
    @Published var categorys: [Category] = []
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
        fetchAllPersons()
    }
    
    func fetchAllPersons() {
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Category.name, ascending: true)]
        do {
            categorys = try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch persons: \(error)")
        }
    }
    
    func createPerson(name: String, color: String, context: NSManagedObjectContext) {
        let newCategory = Category(context: context)
        newCategory.id = UUID()
        newCategory.name = name
        newCategory.color = color
        saveContext(context: context)
    }

    func saveContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
