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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hey im being called")
        readJSON()
    }
    
//JIM function
    private func retrieveJSON() -> [String : Any]? {
        guard let path = Bundle.main.url(forResource: "Affirmations", withExtension: "json")
            else { print("bad path"); return nil }
        guard let jsonData = try? Data(contentsOf: path, options: .mappedIfSafe)
            else { print("bad jsonData"); return nil }
        guard let jsonResult = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String : Any]
            else { print("bad jsonResult"); return nil }
        return jsonResult
    }
    
    
    
    // StackOverflow function 
    
    
    private func readJSON() {
        print("reading")
        do {
            if let file = Bundle.main.url(forResource: "Affirmations", withExtension: "json") {
                let data = try Data(contentsOf: file)
                print("Data - \(data)")
                
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                if let object = json as? [String: Any] {
                    //json is a dictionary 
                    print(object)
                }else if let object = json as? [Any] {
                    //json is an Array
                    print(object)
                } else {
                    print("Json is bad. Try again.")
                }
            }else{
                print("No file")
            }
        }catch{
            print("failing")
            print(error.localizedDescription)
        }
      }
        
        

    
    
    
    
}
    




