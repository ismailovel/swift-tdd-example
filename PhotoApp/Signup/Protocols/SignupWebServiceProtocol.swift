//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Ismailov on 4.11.2025.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
