//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Ismailov on 3.11.2025.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmailFormat(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
