import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @State private var notificationsEnabled: Bool = false
    @State private var saved: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .accessibilityIdentifier("settings.toggle")

            if saved {
                Text("Settings saved!")
                    .foregroundColor(.green)
                    .accessibilityIdentifier("settings.savedLabel")
            }

            Button(action: saveSettings) {
                Text("Save")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("settings.saveButton")

            Button(action: { dismiss() }) {
                Text("Back")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("settings.backButton")

            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.top, 24)
        .navigationTitle("Settings")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            notificationsEnabled = appState.notificationsEnabled
        }
    }

    private func saveSettings() {
        appState.notificationsEnabled = notificationsEnabled
        saved = true
    }
}
