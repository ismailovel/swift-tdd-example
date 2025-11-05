//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Ismailov on 4.11.2025.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.invalidResponseModel)
        } else {
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
    
}
