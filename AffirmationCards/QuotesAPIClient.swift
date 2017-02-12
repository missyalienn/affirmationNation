//
//  QuotesAPIClient.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/5/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit

class QuoteAPIClient {
    
    typealias JSON = [String : Any]
    
    static func getDataFromAPI(with completion: @escaping (JSON) -> ()) {
        
        let urlString = "http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
        
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else {return}
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            print("Start")
            
            guard let unwrappedData = data else {return}
            
            do {
                
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! JSON
                print(responseJSON["quoteAuthor"]!)
                completion(responseJSON)
                print("Got data successfuly")
                
            } catch {
                print(error)
                print(error.localizedDescription)
                
            }
            
            
        }
        task.resume()
        
    }
        
        
        
        
        
   
    

    
    
}
