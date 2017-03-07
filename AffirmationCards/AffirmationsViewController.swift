//
//  AffirmationsViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/21/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class AffirmationsViewController: UIViewController {
    
    
    @IBOutlet weak var affTitleLabel: UILabel!
    
    @IBOutlet weak var affBodyTextView: UITextView!

    
    
    var affCards = [AffCard]()
    let store = DataStore.sharedInstance
    
    
    var affirmationsArray = [AffirmationCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hey im being called")
        AffAPIClient.readJSON { (affirmationCardArray) in
            
            //use instance of array of AffirmationCards equal to argument in function
            self.affirmationsArray = affirmationCardArray
            
            let randomIndex = Int(arc4random_uniform(UInt32(self.affirmationsArray.count)))
            let randomCard = self.affirmationsArray[randomIndex]
            
            self.affTitleLabel.text = randomCard.cardTitle
            self.affBodyTextView.text = randomCard.cardBody
        
        }
    
    }
  
    

    @IBAction func getNewAffirmationPressed(_ sender: Any) {
        DispatchQueue.main.async {
            AffAPIClient.readJSON(with: { (affirmationCardArray) in
                self.affirmationsArray = affirmationCardArray
                let randomIndex = Int(arc4random_uniform(UInt32(self.affirmationsArray.count)))
                let randomCard = self.affirmationsArray[randomIndex]
                
                self.affTitleLabel.text = randomCard.cardTitle
                self.affBodyTextView.text = randomCard.cardBody
                
            })
            
        }
        
    }
    
    

    
    
    @IBAction func favPressed(_ sender: Any) {
       //favoriteCard(card: AffCard)
       
    }
    
    
    func saveAffirmation(titleString: String, bodyString: String) {
        
        let managedContext = store.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AffCard", in: managedContext)
        
        if let unwrappedEntity  = entity {
            let affirmation = NSManagedObject(entity: unwrappedEntity, insertInto: managedContext) as! AffCard
//            affCard.setValue(titleString, forKeyPath: "titleString")
//            affCard.setValue(bodyString, forKeyPath: "bodyString")
            
            affirmation.title = titleString
            affirmation.body = bodyString
            
            do {
                
                try managedContext.save()
                affCards.append(affirmation)
                print("saved successfully")
            } catch let error as NSError {
                print ("Not able to save. \(error), \(error.userInfo)")
            }
            
        }
    }
    

    
    func favoriteCard(card: AffCard) {
       let managedContext = store.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AffCard", in: managedContext)
        
        if let unwrappedEntity = entity {
            let affCard = NSManagedObject(entity: unwrappedEntity, insertInto: managedContext) as! AffCard
            
            if card.favorited == true {
                do{
                    try managedContext.save()
                    affCards.append(affCard)
                    print("saved successfully")
                    
                }catch let error as NSError {
                    print("Not able to save. \(error), \(error.userInfo)")
                }
            }
        }
        
    }
      
    
    func fetchCards() {
        
        let managedContext = store.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AffCard>(entityName: "AffCard")
        
        do {
            self.affCards = try managedContext.fetch(fetchRequest)
            print("There are \(affCards.count) affirmation cards.")
            //self.tableView.reloadData()
        } catch {
            print("Error fetching data")
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
    
    
  }


    







