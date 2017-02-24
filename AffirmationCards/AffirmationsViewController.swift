//
//  AffirmationsViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/21/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit



class AffirmationsViewController: UIViewController {
    
    
    @IBOutlet weak var affTitleLabel: UILabel!
    
    @IBOutlet weak var affBodyTextView: UITextView!

    var affirmationsArray = [AffirmationCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hey im being called")
        AffAPIClient.readJSON { (affirmationCardArray) in
            
            
            self.affirmationsArray = affirmationCardArray
            
            
            let randomIndex = Int(arc4random_uniform(UInt32(self.affirmationsArray.count)))
            let randomCard = self.affirmationsArray[randomIndex]
            
            self.affTitleLabel.text = randomCard.cardTitle
            self.affBodyTextView.text = randomCard.cardBody
            
//            self.affTitleLabel.text = "\(data["affTitle"])"
//            self.affBodyTextView.text = "\(data["affBody"])"
        }
    
    }
    
    
//func readJSON() {
//        print("reading")
//        do {
//            if let file = Bundle.main.url(forResource: "Affirmations", withExtension: "json") {
//                let data = try Data(contentsOf: file)
//                print("Data - \(data)")
//                
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//                if let object = json as? [String: Any] {
//                    //json is a dictionary 
//                    print(object)
//                }else if let object = json as? [Any] {
//                    //json is an Array
//                    print(object)
//                } else {
//                    print("Json is bad. Try again.")
//                }
//            }else{
//                print("No file")
//            }
//        }catch{
//            print("failing")
//            print(error.localizedDescription)
//        }
//      }
//    
//    }

    
   
    
    
}






