import SwiftUI

struct RegisterScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var age = "" 

    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var registrationError: String? = nil
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
                        .frame(width: 180, height: 180)
                        .padding(.top, 50)
                    
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
                        
                        TextField("Eerste Naam", text: $firstName)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))

                        TextField("Leeftijd", text: $age)
                            .keyboardType(.numberPad)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.bottom, 20)
                    
                    Text("Let op! Gebruik alleen uw eerste naam en kies een sterk wachtwoord!")
                        .font(.system(size: 22, weight: .light))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: "0C0850"))
                        

                    Button {
                        registerUser()
                    } label: {
                        Text("Registreer")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .frame(width: 250, height: 50)
                            .background(Color(hex: "FAD15F"))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .onTapGesture {
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }

                    if let registrationError = registrationError {
                        Text(registrationError)
                            .foregroundColor(.red)
                            .padding()
                    }

                    Spacer()

                    
                    NavigationLink(destination: YouthInterests(), isActive: $navigateToYouth) {
                        EmptyView()
                    }
                    NavigationLink(destination: ElderlyInterests(), isActive: $navigateToElderly) {
                        EmptyView()
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .onAppear {
               
            }
        }
    }

    // Registration function
    func registerUser() {
        guard let ageInt = Int(age) else {
            registrationError = "Voer een geldige leeftijd in."
            return
        }

        authViewModel.register(email: email, password: password, name: firstName, age: ageInt) { error in
            if let error = error {
                registrationError = error.localizedDescription
            } else {
                registrationError = nil
                if ageInt < 60 {
                    navigateToYouth = true
                } else {
                    navigateToElderly = true
                }
            }
        }
    }
}

#Preview {
    RegisterScreen()
        .environmentObject(AuthViewModel())
}
