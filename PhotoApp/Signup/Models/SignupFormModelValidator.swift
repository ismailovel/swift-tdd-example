//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Ismailov on 27.10.2025.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    deinit {
        
    }
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLenght || firstName.count > SignupConstants.firstNameMaxLenght {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.LastNameMinLenght || lastName.count > SignupConstants.LastNameMaxLenght {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength ||
            password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
