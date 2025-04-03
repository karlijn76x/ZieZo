import SwiftUI

struct PopupView: View {
    var onClose: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Image("ZieZoLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .foregroundColor(.white)
                
                Text("U krijgt een profiel te zien van een match.")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                Text("U kunt kiezen of u met deze persoon wilt praten. Klik op groen voor ja, op rood voor nee.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                Text("⚠️ Let op!")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .bold()
                
                Text("Deel nooit persoonlijke gegevens, maak nooit geld over en installeer geen onbekende dingen.")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                
                Button(action: onClose) {
                    Text("Sluiten")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 220, height: 60)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .frame(width: 380)
            .padding(50)
            .cornerRadius(30)
            .shadow(radius: 12)
        }
    }
}
