//
//  ChatCallDashboardYouth.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//



import SwiftUI

struct ChatCallDashboardYouth: View {
    var body: some View {
            ZStack {
                Image("BackgroundYoungMatch")
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
                        NavigationLink(destination: ChatView()) {  // Zorg ervoor dat ChatView() de juiste bestemming is
                            ContactRoww(imageName: "GeertImage", name: "Geert", messageCount: 1)
                        }
                    }
                    .padding(.top, 20)

                    Spacer()

                    // Home-knop
                    NavigationLink(destination: YouthMatchingMarie()) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .background(Color(hex: "70BFED"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.bottom, 30)
                    .padding(.leading, -150)
                }
            }
        }
    }

// Component voor de contactrijen
struct ContactRoww: View {
    var imageName: String
    var name: String
    var messageCount: Int
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    
                    Text(name)
                        .font(.system(size: 25, weight: .bold))
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
                
                
                Text("Jij: Hallo, Ik ben Sanne!")
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 65)
                    .padding(.top, -30)
            }
            .background(Color(hex: "70BFED").opacity(0.4)) 
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChatCallDashboardYouth()
}
