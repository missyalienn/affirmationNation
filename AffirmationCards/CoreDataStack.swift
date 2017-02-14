//
//  CoreDataStack.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/14/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack {
    
    
    static let shared = CoreDataStack()
    private init() {}
    
    
    var cards = [Card]()
    
    var context: NSManagedObjectContext {
        
        return persistentContainer.viewContext
        
    }
    
    // MARK: - Core Data stack
    // persistent container holds on to data outside the app
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CardModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    func addToFavorites(card: Card) {
        card.favorited = true
        do {
            try context.save()
        } catch {
            print("Error adding to favorites")
        }
    }
    
    func fetchCards() {
        
    }
    
    func fetchFavorites() -> [Card] {
        //if cards.isEqual to 0 then fetchCards()
        //else just filter out the cards that are favorited
        var favCrds = [Card]()
        for card in self.cards {
            if card.favorited == true {
                favCrds.append(card)
            }
        }
        return favCrds
        
        
    }

    
    
    
    
    
    
}
