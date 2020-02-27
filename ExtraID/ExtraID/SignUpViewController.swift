//
//  SignUpViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/02/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if let email = email, let password = password {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let result = result {
                    self.performSegue(withIdentifier: "ShowApp", sender: nil)
                }
            }
        }
    }

}
