//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Ismailov on 5.11.2025.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupFormModelValidator = SignupFormModelValidator()
            let signupWebService = SignupWebService(urlString: SignupConstants.signupURLString)
            
            signupPresenter = SignupPresenter(formModelValidator: signupFormModelValidator, webService: signupWebService, delegate: self)
        }
    }
    
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
        let signupFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    
    func successfulSignup() {
        // TODO:
    }
    
    func errorHandler(error: SignupError) {
        // TODO:
    }
    
    
}
