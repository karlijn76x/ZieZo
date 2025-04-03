//
//  LoadingYouth.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 02/04/2025.
//

import SwiftUI

struct LoadingYouth: View {
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            Image("BackgroundLogIn")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 5) {
                Image("ZieZoLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 295)
                    .rotationEffect(.degrees(rotation)) // Draait de afbeelding rond zijn middenpunt
                    .offset(y: -70) // Beweeg het logo iets naar boven
                    .animation(
                        Animation.linear(duration: 1.5).repeatForever(autoreverses: false),
                        value: rotation
                    )

                Text("ZieZo, dat wordt\n geregeld!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(hex: "0C0850"))
                    .offset(y: -50)
            }
        }
        .onAppear {
            rotation = 360 // Start de rotatie bij verschijnen
        }
    }
}

#Preview {
    LoadingYouth()
}
