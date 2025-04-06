import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoadingScreen: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var navigateToLogin = false
    @State private var navigateToYouthDashboard = false
    @State private var navigateToElderlyDashboard = false
    @State private var isLoading = true 

    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundHomePage")
                    .resizable()
                    .ignoresSafeArea()

                VStack {
                    Image("ZieZoLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 3000, height: 295)
                        .offset(y: 150)

                    Text("ZieZo")
                        .font(.custom("Julius Sans One", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 140)

                    Spacer()

                    Text("'Brengt generaties samen'")
                        .font(.custom("AlbertSans-Regular", size: 19))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                }
                .padding(.bottom, 10)

                // NavigationLinks (conditional based on login and age)
                NavigationLink(destination: LogIn(), isActive: $navigateToLogin) {
                    EmptyView()
                }
                NavigationLink(destination: ChatCallDashboardYouth(), isActive: $navigateToYouthDashboard) {
                    EmptyView()
                }
                NavigationLink(destination: Dashboard(), isActive: $navigateToElderlyDashboard) {
                    EmptyView()
                }
            }
            .onAppear {
                checkLoginStatus()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func checkLoginStatus() {
            if let user = Auth.auth().currentUser {
                // User is logged in, get the age and navigate
                fetchUserAgeAndNavigate(uid: user.uid)
            } else {
                // No user logged in, navigate to login
                navigateToLogin = true
            }
    }

    //func to navigate and check for age
    func fetchUserAgeAndNavigate(uid: String) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { snapshot, error in
            isLoading = false
            if let error = error {
                print("Error fetching user data: \(error)")
                navigateToLogin = true
            } else if let snapshot = snapshot, let data = snapshot.data(), let age = data["age"] as? Int {
                if age < 60 {
                    navigateToYouthDashboard = true
                } else {
                    navigateToElderlyDashboard = true
                }
            } else {
                print("Age not found for user")
                navigateToLogin = true
            }
        }
    }
}

#Preview {
    LoadingScreen()
        .environmentObject(AuthViewModel())
}
