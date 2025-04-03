//
//  Dashboard.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        NavigationView {
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
                                    
                    Text("ZieZo")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(Color(hex: "0C0850"))
                    .padding(.top, -78)
                    .padding(.leading, 50)

                    
                    Spacer()
                    
                    // Klikbare knoppen
                    VStack(spacing: 80) {
                        NavigationLink(destination: ElderlyMatchingSanne()) {
                            CustomButton(text: "Zoek personen")
                        }
                        NavigationLink(destination: ChatCallDashboard()) {
                            CustomButton(text: "ChatCall")
                        }
                        NavigationLink(destination: ProfielView()) {
                            CustomButton(text: "Profiel")
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

// Stijl voor de knoppen
struct CustomButton: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(Color(hex: "0C0850"))
            .frame(width: 250, height: 80)
            .background(Color(hex: "FAD15F").opacity(0.6))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(hex: "0C0850"), lineWidth: 3)
            )
    }
}


struct ProfielView: View {
    var body: some View {
        Text("Profiel Pagina")
    }
}



#Preview {
    Dashboard()
}
