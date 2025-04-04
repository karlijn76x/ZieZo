//
//  ElderlyMatching.swift
//  ZieZo
//
//  Created by Karlijn van den Herik on 03/04/2025.
//

import SwiftUI

struct ElderlyMatchingKen: View {
    @State var showPopup: Bool = false
    
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

                    Image("KenImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.white, lineWidth: 4)
                        )
                    

                    Text("Ken, 22")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text("📍 Eindhoven • 4 KMS VANDAAN")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)

                    HStack {
                        CircleButton(iconName: "xmark", color: .red, destination: AnyView(ElderlyMatchingSanne()))
                        Spacer()
                        CircleButton(iconName: "checkmark", color: .green, destination: AnyView(ChatCallDashboard()))
                    }

                    .padding(.horizontal, 12)
                    .padding(.bottom, 20)
                }

                // Home-knop - Navigatie naar 'Dashboard'
                NavigationLink(destination: Dashboard()) {
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


struct ElderlyMatchingKen_Previews: PreviewProvider {
    static var previews: some View {
        ElderlyMatchingKen()
    }
}

