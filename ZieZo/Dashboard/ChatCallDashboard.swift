//
//  ChatCallDashboard.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//

import SwiftUI

struct ChatCallDashboard: View {
    var body: some View {
        NavigationStack {
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
                        NavigationLink(destination: ChatView()) {
                            ContactRow(imageName: "SanneImage", name: "Sanne", messageCount: 5)
                        }
                        
                        NavigationLink(destination: ChatView()) {
                            ContactRow(imageName: "KenImage", name: "Alex", messageCount: 2)
                        }
                    }
                    .padding(.top, 20)

                    Spacer()

                    // Home-knop
                    NavigationLink(destination: Dashboard()) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .background(Color(hex: "FAD15F").opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .modifier(StrokeModifier())
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

// Component voor de contactrijen
struct ContactRow: View {
    var imageName: String
    var name: String
    var messageCount: Int

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .modifier(StrokeModifier())
            
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
        .modifier(StrokeModifier())
        .padding(.horizontal, 20)
    }
}

// Modifier voor consistente styling
struct StrokeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
    }
}

// Hex-kleur extensie (verbeterd)
extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        
        var rgb: UInt64 = 0
        if scanner.scanHexInt64(&rgb) {
            let r = Double((rgb >> 16) & 0xFF) / 255.0
            let g = Double((rgb >> 8) & 0xFF) / 255.0
            let b = Double(rgb & 0xFF) / 255.0
            
            self.init(red: r, green: g, blue: b, opacity: opacity)
        } else {
            self.init(red: 0, green: 0, blue: 0, opacity: opacity) // Fallback kleur
        }
    }
}

#Preview {
    ChatCallDashboard()
}
