# ds-ios-xcuitest

A minimal iOS SwiftUI app designed for UI test automation using XCUITest, by Dustin Sison.

## Project Structure

```
DSXCUITestApp/
├── DSXCUITestApp.xcodeproj/       # Xcode project file
├── DSXCUITestApp/
│   ├── DSXCUITestApp.swift        # App entry point
│   ├── AppState.swift             # Shared observable state
│   ├── LoginView.swift            # Login screen
│   ├── HomeView.swift             # Home screen
│   ├── SettingsView.swift         # Settings screen
│   └── Assets.xcassets/           # App assets
└── DSXCUITestAppUITests/
    └── DSXCUITestAppUITests.swift  # XCUITest suite
```

## Screens & Flows

### Login Screen
- **Email** text field (`login.emailField`)
- **Password** secure field (`login.passwordField`)
- **Login** button (`login.submitButton`)
- **Error** label shown on invalid credentials (`login.errorLabel`)

Login succeeds only with:
- Email: `qa@example.com`
- Password: `Password123`

### Home Screen
- **Welcome** label (`home.welcomeLabel`)
- **Settings** navigation button (`home.settingsButton`)
- **Logout** button (`home.logoutButton`) — returns to Login Screen

### Settings Screen
- **Notifications** toggle (`settings.toggle`)
- **Save** button (`settings.saveButton`) — persists toggle state for the session
- **Back** button (`settings.backButton`) — returns to Home Screen

## Accessibility Identifiers

All interactive UI elements use clear accessibility identifiers following the `screen.elementName` convention:

| Identifier              | Element                          |
|-------------------------|----------------------------------|
| `login.emailField`      | Email text field on Login screen |
| `login.passwordField`   | Password secure field            |
| `login.submitButton`    | Login submit button              |
| `login.errorLabel`      | Error message label              |
| `home.welcomeLabel`     | Welcome label on Home screen     |
| `home.settingsButton`   | Navigate to Settings button      |
| `home.logoutButton`     | Logout button                    |
| `settings.toggle`       | Notifications toggle             |
| `settings.saveButton`   | Save settings button             |
| `settings.backButton`   | Back to Home button              |

## Running the UI Tests

Open `DSXCUITestApp.xcodeproj` in Xcode, select the `DSXCUITestAppUITests` scheme, and press `Cmd+U` to run all UI tests.

The test suite covers:
- Login screen elements exist
- Successful login navigates to Home
- Invalid credentials show error message
- Home screen elements exist
- Logout returns to Login
- Navigation to Settings screen
- Settings back button returns to Home
- Toggle state persists during the session
- Save button confirms settings saved

## Requirements

- Xcode 15+
- iOS 17.0+ deployment target
- Swift 5.0+
