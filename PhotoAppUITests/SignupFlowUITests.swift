//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Ismailov on 27.10.2025.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["firstNameTextField"].firstMatch
        let lastName = app.textFields["lastNameTextField"].firstMatch
        let email = app.textFields["emailTextField"].firstMatch
        let password = app.secureTextFields["passwordTextField"].firstMatch
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"].firstMatch
        let signupButton = app.buttons["signupButton"].firstMatch
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() throws {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["firstNameTextField"].firstMatch
        firstName.tap()
        firstName.typeText("S")
        
        let lastName = app.textFields["lastNameTextField"].firstMatch
        lastName.tap()
        lastName.typeText("K")
        
        let email = app.textFields["emailTextField"].firstMatch
        email.tap()
        email.typeText("@")
        
        let password = app.secureTextFields["passwordTextField"].firstMatch
        password.tap()
        password.typeText("123456")
        
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"].firstMatch
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        let signupButton = app.buttons["signupButton"].firstMatch
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
