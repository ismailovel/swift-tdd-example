//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Ismailov on 6.11.2025.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: any PhotoApp.SignupModelValidatorProtocol, webService: any PhotoApp.SignupWebServiceProtocol, delegate: any PhotoApp.SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
    
}
