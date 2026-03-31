import XCTest

final class DSXCUITestAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // MARK: - Login Screen Tests

    func testLoginScreenElementsExist() throws {
        XCTAssertTrue(app.textFields["login.emailField"].exists)
        XCTAssertTrue(app.secureTextFields["login.passwordField"].exists)
        XCTAssertTrue(app.buttons["login.submitButton"].exists)
        XCTAssertFalse(app.staticTexts["login.errorLabel"].exists)
    }

    func testSuccessfulLogin() throws {
        fillLoginForm(email: "qa@example.com", password: "Password123")
        app.buttons["login.submitButton"].tap()

        XCTAssertTrue(app.staticTexts["home.welcomeLabel"].waitForExistence(timeout: 5))
    }

    func testInvalidLoginShowsError() throws {
        fillLoginForm(email: "wrong@example.com", password: "wrongpassword")
        app.buttons["login.submitButton"].tap()

        XCTAssertTrue(app.staticTexts["login.errorLabel"].waitForExistence(timeout: 5))
    }

    func testInvalidPasswordShowsError() throws {
        fillLoginForm(email: "qa@example.com", password: "WrongPassword")
        app.buttons["login.submitButton"].tap()

        XCTAssertTrue(app.staticTexts["login.errorLabel"].waitForExistence(timeout: 5))
    }

    // MARK: - Home Screen Tests

    func testHomeScreenElementsExist() throws {
        try loginSuccessfully()

        XCTAssertTrue(app.staticTexts["home.welcomeLabel"].exists)
        XCTAssertTrue(app.buttons["home.settingsButton"].exists)
        XCTAssertTrue(app.buttons["home.logoutButton"].exists)
    }

    func testLogoutReturnsToLoginScreen() throws {
        try loginSuccessfully()

        app.buttons["home.logoutButton"].tap()

        XCTAssertTrue(app.textFields["login.emailField"].waitForExistence(timeout: 5))
    }

    // MARK: - Settings Screen Tests

    func testNavigateToSettings() throws {
        try loginSuccessfully()

        app.buttons["home.settingsButton"].tap()

        XCTAssertTrue(app.switches["settings.toggle"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.buttons["settings.saveButton"].exists)
        XCTAssertTrue(app.buttons["settings.backButton"].exists)
    }

    func testSettingsBackButtonReturnsToHome() throws {
        try loginSuccessfully()

        app.buttons["home.settingsButton"].tap()
        XCTAssertTrue(app.buttons["settings.backButton"].waitForExistence(timeout: 5))

        app.buttons["settings.backButton"].tap()

        XCTAssertTrue(app.staticTexts["home.welcomeLabel"].waitForExistence(timeout: 5))
    }

    func testSettingsTogglePersistsDuringSession() throws {
        try loginSuccessfully()

        // Navigate to settings and enable notifications
        app.buttons["home.settingsButton"].tap()
        let toggle = app.switches["settings.toggle"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 5))

        let initialValue = toggle.value as? String
        toggle.tap()
        app.buttons["settings.saveButton"].tap()
        app.buttons["settings.backButton"].tap()

        // Navigate to settings again and check toggle persisted
        XCTAssertTrue(app.buttons["home.settingsButton"].waitForExistence(timeout: 5))
        app.buttons["home.settingsButton"].tap()

        let persistedToggle = app.switches["settings.toggle"]
        XCTAssertTrue(persistedToggle.waitForExistence(timeout: 5))
        XCTAssertNotEqual(persistedToggle.value as? String, initialValue)
    }

    func testSettingsSaveButton() throws {
        try loginSuccessfully()

        app.buttons["home.settingsButton"].tap()

        let toggle = app.switches["settings.toggle"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 5))
        toggle.tap()

        app.buttons["settings.saveButton"].tap()

        XCTAssertTrue(app.staticTexts["settings.savedLabel"].waitForExistence(timeout: 5))
    }

    // MARK: - Helpers

    private func fillLoginForm(email: String, password: String) {
        let emailField = app.textFields["login.emailField"]
        let passwordField = app.secureTextFields["login.passwordField"]

        emailField.tap()
        emailField.typeText(email)

        passwordField.tap()
        passwordField.typeText(password)
    }

    private func loginSuccessfully() throws {
        fillLoginForm(email: "qa@example.com", password: "Password123")
        app.buttons["login.submitButton"].tap()
        XCTAssertTrue(app.staticTexts["home.welcomeLabel"].waitForExistence(timeout: 5))
    }
}
