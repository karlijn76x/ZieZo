import SwiftUI

struct LogIn: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var loginError: String? = nil
    @State private var navigateToYouth = false
    @State private var navigateToElderly = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundLogIn")
                    .resizable()
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("ZieZoLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 230)
                        .padding(.top, -10)

                    Text("Welkom bij ZieZo!")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(Color(hex: "0C0850"))

                    Text("De app die jong en oud verbindt \n– ontmoet, leer en ontdek samen!")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "0C0850"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()

                    VStack(spacing: 15) {
                        TextField("E-mail adres", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))

                        SecureField("Wachtwoord", text: $password)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }

                    if let loginError = loginError {
                        Text(loginError)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Button(action: {
                        loginUser()
                    }) {
                        Text("Login!")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .frame(width: 200, height: 50)
                            .background(Color(hex: "70BFED"))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.top, 20)

                    Text("Nog geen account?")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "0C0850"))
                        .padding(.top, 10)

                    NavigationLink(destination: RegisterScreen()) {
                        Text("Meld je aan")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .frame(width: 250, height: 50)
                            .background(Color(hex: "FAD15F"))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.bottom, 30)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .background(
                Group {
                    NavigationLink(destination: YouthInterests(), isActive: $navigateToYouth) {
                        EmptyView()
                    }
                    NavigationLink(destination: ElderlyInterests(), isActive: $navigateToElderly) {
                        EmptyView()
                    }
                }
            )
        }
    }

    // Login function
    func loginUser() {
        authViewModel.login(email: email, password: password) { error, age in
            if let error = error {
                loginError = error.localizedDescription
            } else if let age = age {
                loginError = nil
                if age < 60 {
                    navigateToYouth = true
                } else {
                    navigateToElderly = true
                }
            }
        }
    }
}

// Extensie om hex-kleuren te gebruiken in SwiftUI
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}



#Preview {
    LogIn()
        .environmentObject(AuthViewModel())
}
