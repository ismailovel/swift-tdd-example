//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Ismailov on 3.11.2025.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signupFormModel = SignupFormModel(firstName: "Elchin",
                                          lastName: "Ismailov",
                                          email: "test@test.com",
                                          password: "123456",
                                          repeatPassword: "123456")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockSignupViewDelegate
        )
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email format was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Equality of passwords was not validated")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOparationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignup method was called more than one time")
        
    }
    
    func testSignupPresenter_WhenSignupOparationFails_CallsErrorOnViewDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler method to be called")
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebService.shouldReturnError = true
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
        
    }
    
}
