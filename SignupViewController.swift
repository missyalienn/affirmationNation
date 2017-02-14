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
        
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
        
    
    
    @IBAction func loginButtonTouched(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
           
            if let error = error {
                print(error.localizedDescription)
                print("Error signing in.")
            }else {
                if (FIRAuth.auth()?.currentUser) != nil{
                    print("User is current user. No errors")
                    self.performSegue(withIdentifier: "showQuote", sender: self)
                

                }
            }
            
            
            
        })
        
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuote" {
            
            if let dest = segue.destination as? ViewController{
//                guard let email = emailTextField.text else {return}
//                dest.userEmail = email // do not try to set text in a segue.
            }
        }
        
    }
    
        
}
    
    



