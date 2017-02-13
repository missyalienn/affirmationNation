//
//  LoginViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/13/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class LoginViewController: UIViewController {

    let loginView = LoginView()
    //let containerVC = (UIApplication.shared.delegate as? AppDelegate)?.containerViewController
   // let store = DataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loginView.emailField.delegate = self
//        loginView.passwordField.delegate = self
        
        //Add Targets for all buttons here:

        view.addSubview(loginView)
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
     //closes viewDidLoad
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
