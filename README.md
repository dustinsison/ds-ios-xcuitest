# ds-ios-xcuitest

A sample iOS SwiftUI application and XCUITest automation framework designed to demonstrate **maintainable UI testing architecture**, **reliable interaction patterns**, and **testability-driven UI design**.

This project intentionally prioritizes stability, clarity, and deterministic behavior to reflect real-world UI automation best practices.

---

## Project Structure

```
ds-ios-xcuitest/
├── DSXCUITestApp/
│   ├── App/
│   │   └── DSXCUITestApp.swift
│   ├── Models/
│   │   └── AppState.swift
│   ├── Screens/
│   │   ├── LoginView.swift
│   │   ├── HomeView.swift
│   │   └── SettingsView.swift
│   └── Assets.xcassets/
│
├── DSXCUITestAppUITests/
│   ├── Base/
│   │   ├── BaseUITest.swift
│   │   └── XCUIApplication+Launch.swift
│   ├── Pages/
│   │   ├── LoginPage.swift
│   │   ├── HomePage.swift
│   │   └── SettingsPage.swift
│   ├── Helpers/
│   │   └── XCUIElement+Typing.swift
│   ├── Fixtures/
│   │   └── TestUsers.swift
│   └── Tests/
│       ├── LoginTests.swift
│       ├── HomeTests.swift
│       └── SettingsTests.swift
│
├── DSXCUITestApp.xcodeproj
└── README.md
```

---

## Automation Architecture

The UI test suite is structured as a **scalable XCUITest framework**, not a single flat test file.

### Key Layers

* **Base**

  * Shared setup and teardown
  * Standardized app launch configuration
  * Failure handling (e.g., screenshots)

* **Pages (Page Objects)**

  * Encapsulate UI structure and interactions
  * Abstract away element locators from tests
  * Improve readability and maintainability

* **Helpers**

  * Reusable XCUIElement utilities
  * Common interaction patterns (e.g., text input)

* **Fixtures**

  * Centralized test data (valid/invalid users)

* **Tests**

  * Organized by feature (Login, Home, Settings)
  * Focused, readable, and independent

---

## App Overview

This demo app simulates a simple authenticated flow:

### Login Screen

* Email field (`login.emailField`)
* Password field (`login.passwordField`)
* Login button (`login.submitButton`)
* Error label (`login.errorLabel`)

### Home Screen

* Welcome label (`home.welcomeLabel`)
* Settings navigation (`home.settingsButton`)
* Logout (`home.logoutButton`)

### Settings Screen

* Toggle row (`settings.toggleRow`)
* Save button (`settings.saveButton`)
* Back button (`settings.backButton`)

---

## Test Coverage

The test suite validates:

* Login screen visibility
* Successful authentication flow
* Error handling for invalid credentials
* Navigation between screens
* Logout behavior
* Settings persistence across navigation
* UI state consistency

---

## Testability-Driven UI Design

This project intentionally applies **testability-first design principles**.

### Example: Toggle Implementation

Instead of relying on SwiftUI’s native `Toggle` control (which can be inconsistent in UI tests), the settings toggle is implemented as a **tappable row** with:

* a stable accessibility identifier (`settings.toggleRow`)
* an explicit accessibility value (`On` / `Off`)

### Benefits

* Reliable tap interaction
* Deterministic state assertions
* Reduced flakiness in XCUITest
* Clear separation between UI behavior and test logic

This reflects a broader principle:

> UI components should be designed with automation in mind, not treated as an afterthought.

---

## 🔍 Accessibility Strategy

All interactive elements use consistent identifiers following:

```
screen.elementName
```

Examples:

| Identifier            | Description            |
| --------------------- | ---------------------- |
| `login.emailField`    | Login email input      |
| `login.submitButton`  | Login button           |
| `home.settingsButton` | Navigate to settings   |
| `settings.toggleRow`  | Toggle interaction row |

Additionally, some elements expose **accessibility values** (e.g., `"On"` / `"Off"`) to support deterministic assertions.

---

## 🚀 Running Tests

1. Open `DSXCUITestApp.xcodeproj` in Xcode
2. Select a simulator (e.g., iPhone 15)
3. Run:

```
Cmd + U
```

---

## ⚙️ Requirements

* Xcode 15+
* iOS 17+
* Swift 5+

---

## 💡 Key Takeaways

* UI automation benefits from **intentional architecture**
* Page Object patterns improve maintainability and clarity
* UI tests should **verify state**, not assume interactions succeed
* Designing UI for testability reduces flakiness and improves reliability
* Small, well-structured frameworks outperform large unstructured test suites

---

## 👤 Author

Dustin Sison
Software QA Engineer | Automation | Mobile & Web Testing

