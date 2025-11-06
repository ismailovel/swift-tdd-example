//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Ismailov on 6.11.2025.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}
