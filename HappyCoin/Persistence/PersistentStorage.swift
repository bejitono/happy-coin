//
//  PersistentStorage.swift
//  HappyCoin
//
//  Created by Stefano on 12.02.21.
//

import CoreData

protocol PersistentStorable {
    var context: NSManagedObjectContext { get }
    func saveContext()
}

final class PersistentStorage: PersistentStorable {
    
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HappyCoin")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch { let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
