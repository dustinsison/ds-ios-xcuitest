// LoginPage.swift
// Encapsulates interactions and assertions for the login screen.

import XCTest

struct LoginPage {
    let app: XCUIApplication

    private var emailField: XCUIElement { app.textFields["login.emailField"] }
    private var passwordField: XCUIElement { app.secureTextFields["login.passwordField"] }
    private var submitButton: XCUIElement { app.buttons["login.submitButton"] }
    private var errorLabel: XCUIElement { app.staticTexts["login.errorLabel"] }

    @discardableResult
    func assertVisible(timeout: TimeInterval = 5) -> Self {
        XCTAssertTrue(emailField.waitForExistence(timeout: timeout), "Expected login email field to be visible.")
        XCTAssertTrue(passwordField.waitForExistence(timeout: timeout), "Expected login password field to be visible.")
        XCTAssertTrue(submitButton.waitForExistence(timeout: timeout), "Expected login submit button to be visible.")
        return self
    }

    @discardableResult
    func enterEmail(_ value: String) -> Self {
        XCTAssertTrue(emailField.waitForExistence(timeout: 5), "Expected login email field to exist before typing.")
        emailField.clearAndTypeText(value)
        return self
    }

    @discardableResult
    func enterPassword(_ value: String) -> Self {
        XCTAssertTrue(passwordField.waitForExistence(timeout: 5), "Expected login password field to exist before typing.")
        passwordField.clearAndTypeText(value)
        return self
    }

    @discardableResult
    func submit() -> Self {
        XCTAssertTrue(submitButton.waitForExistence(timeout: 5), "Expected login submit button to exist before tapping.")
        submitButton.tap()
        return self
    }

    @discardableResult
    func login(email: String, password: String) -> Self {
        enterEmail(email)
            .enterPassword(password)
            .submit()
    }

    @discardableResult
    func assertErrorVisible(timeout: TimeInterval = 5) -> Self {
        XCTAssertTrue(errorLabel.waitForExistence(timeout: timeout), "Expected login error label to be visible.")
        return self
    }
}
