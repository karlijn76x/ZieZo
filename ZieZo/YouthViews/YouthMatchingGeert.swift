//
//  YouthMatchingGeert.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//

import SwiftUI

struct YouthMatchingGeert: View {
    @State private var showNavBar = false // Dit houdt de zichtbaarheid van de nav bar bij
    
    var body: some View {
        NavigationView {  // Voeg NavigationView toe
            ZStack {
                Image("BackgroundYoungMatch")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("GeertImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 450) // Afbeelding blijft groot
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .padding(.top, 0)
                    
                    HStack {
                        // Home Button (kleiner)
                        Button(action: {
                            withAnimation(.spring()) {
                                showNavBar.toggle() // Toggle de nav bar zichtbaarheid
                            }
                        }) {
                            Image(systemName: "house.fill")
                                .font(.title2)  // Kleinere font
                                .foregroundColor(.yellow)
                                .frame(width: 40, height: 40)
                                .padding(6)
                                .background(Color(hex: "70BFED"))
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color(hex: "#0C0850"), lineWidth: 1)
                                )
                        }
                        
                        Spacer()
                        
                        // Info Button (kleiner)
                        Button(action: {}) {
                            Image(systemName: "info.circle.fill")
                                .font(.title2)
                                .foregroundColor(.yellow)
                                .frame(width: 40, height: 40)
                                .padding(6)
                                .background(Color(hex: "70BFED"))
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color(hex: "#0C0850"), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 20)
                    
                    Text("Geert, 72")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(Color(hex: "#0C0850"))
                        .padding(.top, -50)
                    
                    // Tekst gecentreerd in het midden
                    VStack(spacing: 20) {
                        Text("Geert (72) is een avontuurlijke durfal die zijn adrenaline haalt uit extreme sporten, spooktochten en altijd wint met voetbal.")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .lineLimit(3) // Beperk het aantal regels als de tekst te lang is

                        Text("Wat is de spannendste ervaring die ik ooit hebt meegemaakt tijdens een avontuur?")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .lineLimit(2)
                    }
                    .padding(.top, 2)
                    
                    .padding(.bottom, 20)
                    // Knoppen onder de tekst
                    HStack(spacing: 60) {
                        CircleButtonn(iconName: "xmark", color: .red)
                        CircleButtonn(iconName: "checkmark", color: .green)
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, -19)
                }
                
                // Verticaal navigatiebalk boven de home knop
                if showNavBar {
                    HStack {
                        // Nav Bar - Verticaal
                        VStack {
                            // Chat Button
                            NavigationLink(destination: ChatCallDashboardYouth()) {  // Voeg hier de navigatie toe
                                Image(systemName: "message.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                            }
                            .padding(.top, 10)
                            
                            Spacer()
                            
                            // Sluitknop
                            Button(action: {
                                withAnimation {
                                    showNavBar = false // Sluit de nav bar
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 10)
                        }
                        .frame(width: 50, height: 120)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .transition(.move(edge: .bottom))
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, 240)
                    .padding(.leading, -165)
                }
            }
        }  // Sluit de NavigationView af
    }
}


// Cirkels lay-out
struct CircleButtonn: View {
    var iconName: String
    var color: Color
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 65, height: 65)
                .background(color)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color(hex: "#0C0850"), lineWidth: 1)
                )
                .shadow(radius: 5)
        }
    }
}

#Preview {
    YouthMatchingGeert()
}
