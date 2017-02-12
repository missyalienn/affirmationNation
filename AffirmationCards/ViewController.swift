//
//  ViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 1/18/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteBodyLabel: UILabel!
    
    @IBOutlet weak var quoteAuthorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.themeSunshine
        
        
        configure()
        constrain()
        
    
        QuoteAPIClient.getDataFromAPI { (data) in
            
                self.quoteBodyLabel.text = "\(data["quoteText"]!)"
                self.quoteAuthorLabel.text = "\(data["quoteAuthor"]!)"
        
        }

    }
    
    
    func configure() {
    //configure views and elements here
      self.view.addSubview(quoteBodyLabel)
      self.view.addSubview(quoteAuthorLabel)

    }
    
    
    func constrain() {

    
    }
    
    
    
    @IBAction func quoteButtonPressed(_ sender: Any) {
        
        QuoteAPIClient.getDataFromAPI { (data) in
            
            DispatchQueue.main.async {
                self.quoteBodyLabel.text = "\(data["quoteText"]!)"
                self.quoteAuthorLabel.text = "\(data["quoteAuthor"]!)"
                
            }
        }
    }

}










