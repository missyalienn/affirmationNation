//
//  SignupViewController.swift
//  AffirmationCards
//
//  Created by Missy Allan on 2/13/17.
//  Copyright © 2017 Missy Allan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignupViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func signupButtonTouched(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty else {print ("Email cannot be empty."); return }
        
        guard let password = passwordTextField.text, !password.isEmpty else {print ("Password can not be empty."); return}
        
        let ref = FIRDatabase.database().reference().root
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                ref.child("users").child((user?.uid)!).setValue(email)
                print("sign up button pressed. no errors.")
            } else {
                
                if error != nil {
                    print(error!)
                }
            }
            
        })
        
}


}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


