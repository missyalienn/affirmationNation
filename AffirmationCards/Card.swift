//
//  Card.swift
//  AffirmationCards
//
//  Created by Missy Allan on 1/18/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import Foundation
import UIKit


class AffirmationCard {
    
    var cardTitle: String
    var cardBody: String
  //var cardImageURL: String // don't store a UIImage in a class.
//    var description: String {
//        
//        return cardTitle
//    }
    
    init(cardTitle: String, cardImageURL: String, cardBody: String) {
        
        self.cardTitle = cardTitle
        self.cardBody = cardBody
        
    }

    
    init(dict: [String: Any]) {
        
      self.cardTitle = dict["affTitle"] as! String
        self.cardBody = dict["affBody"] as! String
    }
    
    
    
}

// Always express models as singular

class Quote {
    
    var author: String
    var quoteBody: String
    
    init(author: String, quoteBody: String) {
        
        self.author = author
        self.quoteBody = quoteBody
    }
    
    init(dict: [String: Any]) {
        self.author = dict["quoteAuthor"] as! String
        self.quoteBody = dict["quoteText"] as! String
    }

   
    
}







