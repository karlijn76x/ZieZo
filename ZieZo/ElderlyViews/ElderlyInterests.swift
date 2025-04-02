import SwiftUI

struct ElderlyInterests: View {
    let interests = ["Avontuurlijk", "Sportief", "Koken", "Reizen", "Showbizz", "Geschiedenis", "Muziek", "Tuinieren", "Kunst", "Technologie"]
    
    @State private var selectedInterests: Set<String> = []

    let columns = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]

    var body: some View {
        ZStack {
            Image("BackgroundElders")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("ZieZoLogo")
                        .resizable()
                        .frame(width: 85, height: 85)

                    Text("Wat zijn uw ervaringen?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 20)

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

                Button(action: {
                    print("Geselecteerde interesses: \(selectedInterests)")
                }) {
                    Text("Volgende")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(20)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

#Preview {
    ElderlyInterests()
}
