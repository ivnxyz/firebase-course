//
//  SignInViewController.swift
//  ExtraID
//
//  Created by Iván Martínez on 21/02/20.
//  Copyright © 2020 Iván Martínez. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    // MARK: - Elementos de UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if let email = email, let password = password {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let result = result {
                    let user = result.user
                    
                    if user.isEmailVerified {
                        self.performSegue(withIdentifier: "ShowApp", sender: nil)
                    } else {
                        user.sendEmailVerification { (error) in
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                let alert = UIAlertController(title: "Verifica tu cuenta", message: "Por favor verifica tu correo electrónico", preferredStyle: .alert)
                                
                                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                
                                alert.addAction(okAction)
                                
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }
    }
    

}
