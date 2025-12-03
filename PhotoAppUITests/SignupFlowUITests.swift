//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Ismailov on 27.10.2025.
//

import XCTest

@MainActor
final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey", "-debugServer"]
        app.launchEnvironment = [
            "signupURL": "https://someURL",
            "inAppPurchasesEnabled": "true",
            "inAppAdsEnabled": "true"
        ]
        app.launch()
        
        firstName = app.textFields["firstNameTextField"].firstMatch
        lastName = app.textFields["lastNameTextField"].firstMatch
        email = app.textFields["emailTextField"].firstMatch
        password = app.secureTextFields["passwordTextField"].firstMatch
        repeatPassword = app.secureTextFields["repeatPasswordTextField"].firstMatch
        signupButton = app.buttons["signupButton"].firstMatch

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat Password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interactions")
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() throws {
        
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() throws {
        
        firstName.tap()
        firstName.typeText("Elchin")
        
        lastName.tap()
        lastName.typeText("Ismailov")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3), "A Success Alert dialog was not presented when valid signup form was submitted")
    }

    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
