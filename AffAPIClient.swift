//
//  AffAPIClient.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/23/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation

class AffAPIClient {

   class func readJSON(with completion: @escaping ([AffirmationCard]) -> ()) {
        print("reading")
        do {
            if let file = Bundle.main.url(forResource: "Affirmations", withExtension: "json") {
                let data = try Data(contentsOf: file)
                print("Data - \(data)")
        
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                //print(json)
                if let object = json as? [String: Any] {
                    //json is a dictionary
                    //print(object)
                    let affDictionaryArray = object["Affirmations"] as! [[String:Any]]
                    var affirmationArray = [AffirmationCard]()
                    for affirmationDict in affDictionaryArray {
                       let affirmationCard = AffirmationCard(dict: affirmationDict)
                        affirmationArray.append(affirmationCard)
                        completion(affirmationArray)
                    }
                    
                    
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
