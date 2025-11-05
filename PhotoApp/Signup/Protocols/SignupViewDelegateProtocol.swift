//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Ismailov on 4.11.2025.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    
    func successfulSignup()
    func errorHandler(error: SignupError)
}
