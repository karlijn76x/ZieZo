//
//  LogIn.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 01/04/2025.
//

import SwiftUI

struct RegisterScreen: View {
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
                        .frame(width: 180, height: 180)
                        .padding(.top, 50)
                    
        

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
                        Spacer()

                        SecureField("Wachtwoord", text: $password)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                        Spacer()
                        
                        TextField("Eerste Naam", text: $username)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 320, height: 50)
                            .background(Color(hex: "70BFED").opacity(0.4))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    
                    

                    // LLeeftijdknoppen
                    HStack(spacing: 20) {
                        // Blauwe knop "<60"
                        Button(action: {
                            print("Leeftijd < 60")
                        }) {
                            Text("<60")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color(hex: "0C0850"))
                                .frame(width: 130, height: 50)
                                .background(Color(hex: "70BFED"))
                                .cornerRadius(25)
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                        }
                        
                        // Gele knop ">60"
                        Button(action: {
                            print("Leeftijd > 60")
                        }) {
                            Text(">60")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color(hex: "0C0850"))
                                .frame(width: 130, height: 50)
                                .background(Color(hex: "FAD15F"))
                                .cornerRadius(25)
                                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                        }
                    }
                    .padding(.top, 20)


                    
                    // let op bericht
                    Text("Let op!")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "0C0850"))
                    Text("Gebruik alleen je voornaam en\n kies een sterk wachtwoord!")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "0C0850"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()

                    // "Meld je aan" knop met NavigationLink
                    NavigationLink(destination: RegisterScreen()) {
                        Text("Ga verder")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .frame(width: 250, height: 50)
                            .background(Color(hex: "FAD15F"))
                            .cornerRadius(25)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.bottom, 30)
                    
                                    }
            }
        }
    }
}





#Preview {
    RegisterScreen()
}

