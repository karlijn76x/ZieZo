import SwiftUI

struct ElderlyInterests: View {
    let interests = ["Avontuurlijk", "Sportief", "Koken", "Reizen", "Showbizz", "Geschiedenis", "Muziek", "Tuinieren", "Kunst", "Technologie"]
    
    @State private var selectedInterests: Set<String> = []

    let columns = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]

    var body: some View {
        NavigationView {  // Zorg ervoor dat je een NavigationView toevoegt als dat nog niet gedaan is
            ZStack {
                Image("BackgroundElders")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Image("ZieZoLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 120)

                        Text("Wat zijn uw ervaringen?")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.6)))

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 0)

                    Spacer()

                    ScrollView {
                        VStack {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(interests, id: \.self) { interest in
                                    Button(action: {
                                        if selectedInterests.contains(interest) {
                                            selectedInterests.remove(interest)
                                        } else {
                                            selectedInterests.insert(interest)
                                        }
                                    }) {
                                        VStack {
                                            Circle()
                                                .strokeBorder(selectedInterests.contains(interest) ? Color.blue : Color.clear, lineWidth: 4)
                                                .background(Circle().fill(Color.white))
                                                .frame(width: 120, height: 120)
                                                .overlay(
                                                    Text(interest.prefix(1))
                                                        .font(.largeTitle)
                                                        .foregroundColor(.black)
                                                )

                                            Text(interest)
                                                .font(.title2)
                                                .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                                        }
                                    }
                                    .frame(width: 150, height: 165)
                                    .background(selectedInterests.contains(interest) ? Color.blue.opacity(0.2) : Color.yellow.opacity(0.4))
                                    .cornerRadius(20)
                                }
                            }
                            .padding(.vertical, 20)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
                    }
                    .frame(maxHeight: 600)

                    Spacer()

                    // NavigationLink rondom de "Volgende" knop
                    NavigationLink(destination: LoadingEldery()) {  // Zorg ervoor dat je de LoadingEldery view maakt
                        Text("Volgende")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(30)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 0)
                }
                .padding()
            }
        }
    }
}


#Preview {
    ElderlyInterests()
}

