// LoginTests.swift
// Verifies login screen behavior and authentication flows.

import XCTest

final class LoginTests: BaseUITest {
    func testLoginScreenElementsExist() {
        LoginPage(app: app)
            .assertVisible()
    }

    func testSuccessfulLoginNavigatesToHomeScreen() {
        let loginPage = LoginPage(app: app)
        let homePage = HomePage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.validEmail,
                password: TestUsers.validPassword
            )

        homePage.assertVisible()
    }

    func testInvalidCredentialsShowErrorMessage() {
        let loginPage = LoginPage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.invalidEmail,
                password: TestUsers.invalidPassword
            )
            .assertErrorVisible()
    }
}
