//
//  ElderlyMatching.swift
//  ZieZo
//
//  Created by Karlijn van den Herik on 03/04/2025.
//

import SwiftUI

struct ElderlyMatchingSanne: View {
    @State private var showPopup = false
    
    var body: some View {
        ZStack {
            Image("BackgroundElders")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: { showPopup = true }) {
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding()

                    }
                    Spacer()
                }
                .padding(.leading, 20)
                
                
                Image("SanneImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.white, lineWidth: 4)
                    )
                
                Text("Sanne, 21")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("📍 VENLO • 20 KMS VANDAAN")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                HStack {
                    CircleButton(iconName: "xmark", color: .red, destination: AnyView(ElderlyMatchingKen()))
                    Spacer()
                    CircleButton(iconName: "checkmark", color: .green, destination: AnyView(ChatCallDashboard()))
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 20)
            }
            
            Button(action: {}) {
                Image(systemName: "house.fill")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .padding()
                    .background(Color.yellow)
                    .clipShape(Circle())
            }
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            if showPopup {
                            PopupView(onClose: { showPopup = false })
                        }
                    }
                    .onAppear {
                        showPopup = true  // Zorg ervoor dat de popup getoond wordt als de view verschijnt
                    }
                }
            }


struct CircleButton: View {
    var iconName: String
    var color: Color
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 120, height: 120)
                .background(color)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}


#Preview {
    ElderlyMatchingSanne()
}
