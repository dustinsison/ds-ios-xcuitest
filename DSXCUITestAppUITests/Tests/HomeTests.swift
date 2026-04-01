// HomeTests.swift
// Verifies home screen behavior after successful authentication.

import XCTest

final class HomeTests: BaseUITest {
    func testHomeScreenElementsExistAfterLogin() {
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

    func testLogoutReturnsToLoginScreen() {
        let loginPage = LoginPage(app: app)
        let homePage = HomePage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.validEmail,
                password: TestUsers.validPassword
            )

        homePage
            .assertVisible()
            .logout()

        loginPage.assertVisible()
    }
}
