//
//  LogIn.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 01/04/2025.
//

import SwiftUI

struct LogIn: View {
    @State private var username = ""
    @State private var password = ""
    
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
                    
                    // Welkomsttekst
                    Text("Welkom bij ZieZo!")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(Color(hex: "0C0850"))

                    // Slogan
                    Text("De app die jong en oud verbindt \n– ontmoet, leer en ontdek samen!")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "0C0850"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()

                    // Invoervelden
                    VStack(spacing: 15) {
                        TextField("E-mail adres", text: $username)
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

                    // Login knop
                    Button(action: {
                        print("Inloggen met \(username) en \(password)")
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

                    // Registratie prompt
                    Text("Nog geen account?")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "0C0850"))
                        .padding(.top, 10)

                    // "Meld je aan" knop met NavigationLink
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
}
