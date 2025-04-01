//
//  LoadingScreen.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 01/04/2025.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var navigateToLogin = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("BackgroundHomePage")
                    .resizable()
                    .ignoresSafeArea()

                VStack {
                    Image("ZieZoLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 3000, height: 295)
                        .offset(y: 150)

                    Text("ZieZo")
                        .font(.custom("Julius Sans One", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 140)

                    Spacer()

                    Text("'Brengt generaties samen'")
                        .font(.custom("AlbertSans-Regular", size: 19))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                }
                .padding(.bottom, 10)

                // NavigationLink: De link naar LogIn scherm wordt automatisch geactiveerd na 5 seconden
                NavigationLink(destination: LogIn(), isActive: $navigateToLogin) {
                    EmptyView()
                }
                .onAppear {
                    // Start de timer die na 5 seconden automatisch navigeert
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.navigateToLogin = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingScreen()
}







