//
//  YouthMatchingMarie.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 03/04/2025.
//

import SwiftUI

struct YouthMatchingMarie: View {
    var body: some View {
        ZStack {
            Image("BackgroundYoungMatch")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("MarieImage")
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
                    Button(action: {}) {
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
                
                //Naam
                Text("Marie, 81")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(Color(hex: "#0C0850"))
                .padding(.top, -50)
                
                // Tekst gecentreerd in het midden
                VStack(spacing: 20) {
                    Text("Marie (81) is altijd avontuurlijk. Op haar 70ste reisde ze solo naar Zuid-Amerika en deed mee aan een traditioneel feest in de bergen van Peru.")
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .lineLimit(3) // Beperk het aantal regels als de tekst te lang is

                    Text("Wat heeft ze meegemaakt tijdens haar reis?")
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
        }
    }
}


#Preview {
    YouthMatchingMarie()
}

