//
//  FavCardsTableViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 3/3/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import UIKit
import CoreData


class FavCardsTableViewController: UITableViewController {

    
   var affCards = [AffCard]()
    let store = DataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("running")
        fetchCards()
        self.tableView.reloadData()
<<<<<<< HEAD
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCards()
        self.tableView.reloadData()
    }



=======

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCards()
        self.tableView.reloadData()
    }
    
    
    
    
>>>>>>> 3ba54cdb595580efc26c616c82bf116b331bba61
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return affCards.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "affirmationCell", for: indexPath)

        cell.textLabel?.text = affCards[indexPath.row].title
        cell.detailTextLabel?.text = affCards[indexPath.row].body
       
        return cell
    }
    
    
    
    
<<<<<<< HEAD
  // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
             let savedCard = affCards[indexPath.row]
    
        if editingStyle == .delete {
    
            let context: NSManagedObjectContext = store.persistentContainer.viewContext
            context.delete(affCards[indexPath.row] )
            affCards.remove(at: indexPath.row)
            do {
                try context.save()
            } catch _ {
                print("Error trying to delete")
            }
            
    
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
    }

=======
    
    
    
    
    
>>>>>>> 3ba54cdb595580efc26c616c82bf116b331bba61
    
    
  //MARK: Core Data Save and Fetch

    
    func fetchCards() {
        
        let managedContext = store.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AffCard>(entityName: "AffCard")
        
        do {
            self.affCards = try managedContext.fetch(fetchRequest)
            print("There are \(affCards.count) affirmation cards.")
            self.tableView.reloadData()
        } catch {
            print("Error fetching data")
            print(error.localizedDescription)
        }
    }
    
    
    /*
    func fetchAffCards() {
        let managedContext = store.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<AffCard> = AffCard.fetchRequest()
        do {
            self.affCards = try managedContext.fetch(fetchRequest)
            print(affCards.count)
            self.tableView.reloadData()
        }catch{
            print(error.localizedDescription)
            
        }
        
    }
    */
    
    /*
    func saveAffirmation(titleString: String, bodyString: String) {
        
        let managedContext = store.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AffCard", in: managedContext)
        
        if let unwrappedEntity  = entity {
            let affCard = NSManagedObject(entity: unwrappedEntity, insertInto: managedContext) as! AffCard
            affCard.title = titleString
            affCard.body = bodyString
            
            do {
                try managedContext.save()
                affCards.append(affCard)
                print("saved successfully")
            } catch let error as NSError {
                print ("Not able to save. \(error), \(error.userInfo)")
            }
    
        }
    }
    */
    

}
    
