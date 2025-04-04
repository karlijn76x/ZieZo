import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct ZieZoApp: App {
    @StateObject var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure() 
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingScreen()
            }
            .environmentObject(authViewModel)
        }
    }
}
