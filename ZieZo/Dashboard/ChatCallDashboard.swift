//
//  ChatCallDashboard.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//

import SwiftUI

struct ChatCallDashboard: View {
    var body: some View {
        ZStack {
            Image("BackgroundElders")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Logo en titel
                HStack {
                    Image("ZieZoLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.leading, 20)

                    Spacer()
                }
                
                Text("ChatCall")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(Color(hex: "0C0850"))
                    .padding(.top, -78)
                    .padding(.leading, 50)

                // Lijst met contacten
                VStack(spacing: 15) {
                    ContactRow(imageName: "SanneImage", name: "Sanne", messageCount: 5) {
                        print("Sanne geklikt")
                    }
                    
                    ContactRow(imageName: "KenImage", name: "Alex", messageCount: 2) {
                        print("Alex geklikt")
                    }
                }
                .padding(.top, 20)
                
                
                Spacer()
                
                // Home-knop
                Button(action: {
                    print("Home-knop geklikt")
                }) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(hex: "0C0850"))
                        .padding()
                        .background(Color(hex: "FAD15F").opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 3)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                }
                .padding(.bottom, 30)

            }
        }
    }
}

// Component voor de contactrijen
struct ContactRow: View {
    var imageName: String
    var name: String
    var messageCount: Int
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                
                Text(name)
                    .font(.system(size: 29, weight: .bold))
                    .foregroundColor(Color(hex: "0C0850"))
                
                Spacer()
                
                Text("\(messageCount)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "0C0850"))
                    .padding(10)
                    .background(Color.yellow)
                    .clipShape(Circle())
                
            }
            .padding()
            .background(Color(hex: "FAD15F").opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
        }
        .padding(.horizontal, 20)
    }
}

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b, opacity: opacity)
    }
}


#Preview {
    ChatCallDashboard()
}
