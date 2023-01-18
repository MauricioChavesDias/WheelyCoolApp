//
//  CoreDataManager.swift
//  TheWheelyCool
//
//  Created by Mauricio Dias on 17/3/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TheWheelyCool")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data Stacak \(error)")
            }
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch  {
            viewContext.rollback()
            print("Unable to save item \(error.localizedDescription)")
        }
    }
    
    func fetchAllOptions() -> [Option] {
        let request: NSFetchRequest<Option> = Option.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch  {
            print("Unable to fetch all the options from Core Data \(error.localizedDescription)")
            return []
        }
    }
    
    func getOptionByID(id: NSManagedObjectID) -> Option? {
        do {
            return try viewContext.existingObject(with: id) as? Option
        } catch  {
            print("Unable to get ID from the option \(error.localizedDescription)")
            return nil
        }
        
    }
    
    func delete(option: Option) {
        viewContext.delete(option)
        save()
    }
    
    func create(option: Option) {
        viewContext.insert(option)
        save()
    }
    
    
}
