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
        
        
        
    }
    
    
    
    
    
    
    
    
    //            self.affTitleLabel.text = "\(data["affTitle"])"
    //            self.affBodyTextView.text = "\(data["affBody"])"

    
   
    
    
}






