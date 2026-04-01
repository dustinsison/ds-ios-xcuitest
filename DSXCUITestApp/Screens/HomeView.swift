import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Welcome, QA!")
                .font(.largeTitle)
                .bold()
                .accessibilityIdentifier("home.welcomeLabel")

            NavigationLink {
                SettingsView()
            } label: {
                Text("Settings")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("home.settingsButton")

            Button(action: { appState.logout() }) {
                Text("Logout")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("home.logoutButton")

            Spacer()
        }
        .padding(.horizontal, 32)
        .navigationTitle("Home")
    }
}
