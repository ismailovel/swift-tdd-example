//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Ismailov on 27.10.2025.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSignFormModelValidator_WhenValidFirstName_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Elchin")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "E")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLenght) characters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "ElchinElchin")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLenght) characters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenValidLastName_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Ismailov")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Is")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.LastNameMinLenght) characters but it has returned TRUE")
    }
    
    func testSignFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "IsmailovIsmailov")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.LastNameMaxLenght) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test.com")
        
        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
        
        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
    }
    
    // MARK: Password Validation
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        // Assert
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
    }
}
