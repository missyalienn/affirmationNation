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
       //figure out how to get affirmation to save
        saveAffirmation(titleString: "affTitle", bodyString: "affBody")
        
        
    }
    
    
    func saveAffirmation(titleString: String, bodyString: String) {
        
        let managedContext = store.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AffCard", in: managedContext)
        
        if let unwrappedEntity  = entity {
            let affCard = NSManagedObject(entity: unwrappedEntity, insertInto: managedContext) as! AffCard
            affCard.setValue(titleString, forKeyPath: "affTitle")
            affCard.setValue(bodyString, forKeyPath: "affBody")
            
            do {
                
                try managedContext.save()
                affCards.append(affCard)
                print("saved successfully")
            } catch let error as NSError {
                print ("Not able to save. \(error), \(error.userInfo)")
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //            self.affTitleLabel.text = "\(data["affTitle"])"
    //            self.affBodyTextView.text = "\(data["affBody"])"

    
   
    
    
}






