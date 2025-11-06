//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Ismailov on 5.11.2025.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    @IBAction func signupButtonTapped(_ sender: Any) {
    }
    
}
