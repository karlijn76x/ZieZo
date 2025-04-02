//
//  YouthInterests.swift
//  ZieZo
//
//  Created by Jasmin Hachmane on 02/04/2025.
//

import SwiftUI

struct Interest: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct YouthInterests: View {
    @State private var interests: [Interest] = [
        Interest(name: "Spooky"), Interest(name: "Overleven"), Interest(name: "Wilde natuur"),
        Interest(name: "Gevaarlijke sport"), Interest(name: "Avontuurlijk"), Interest(name: "Sportief"),
        Interest(name: "Survival"), Interest(name: "Romantisch"), Interest(name: "Creatief"),
        Interest(name: "Geluk"), Interest(name: "Historisch"), Interest(name: "Mysterie"),
        Interest(name: "Extreem"), Interest(name: "Showbizz"), Interest(name: "Spionage"), Interest(name: "Uniek")
    ]
    
    @State private var showError = false  // Geeft een foutmelding als er niets is geselecteerd
    @State private var navigateToLoading = false  // Controleert of we naar de volgende pagina moeten gaan
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BackgroundYoung")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Bovenste gedeelte: Logo en tekstwolk
                    HStack {
                        Image("ZieZoLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 120)

                        Text("Waar ben je geïnteresseerd in om te weten?")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.6)))

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 50)

                    Spacer()
                    
                    // Midden: De bubbels
                    FlowLayout(items: $interests) { interest in
                        InterestBubble(interest: interest, onTap: {
                            if let index = interests.firstIndex(where: { $0.id == interest.id }) {
                                interests[index].isSelected.toggle()
                            }
                        })
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()

                    // Foutmelding als er niets geselecteerd is
                    if showError {
                        Text("Selecteer minstens één interesse.")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .bold))
                    }
                    

                    // 'Volgende' knop
                    Button(action: {
                        if interests.contains(where: { $0.isSelected }) {
                            showError = false
                            navigateToLoading = true
                        } else {
                            showError = true
                        }
                    }) {
                        Text("Volgende")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(hex: "0C0850"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "70BFED"))
                            .cornerRadius(30)
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(hex: "0C0850"), lineWidth: 1))
                    }
                    
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)

                    // Navigatie naar LoadingYouth
                    NavigationLink("", destination: LoadingYouth(), isActive: $navigateToLoading)
                        .hidden()
                }
            }
        }
    }
}

struct InterestBubble: View {
    let interest: Interest
    var onTap: () -> Void
    
    var body: some View {
        Text(interest.name)
            .font(.system(size: 14, weight: interest.isSelected ? .bold : .regular))
            .padding()
            .frame(minWidth: 80, maxWidth: 190, minHeight: 90, maxHeight: 120)
            .background(Circle().fill(interest.isSelected ? Color(hex: "70BFED") : Color(hex: "70BFED").opacity(0.4)))
            .overlay(Circle().stroke(Color(hex: "0C0850"), lineWidth: 1))
            .foregroundColor(interest.isSelected ? Color(hex: "0C0850") : Color(hex: "0C0850"))
            .onTapGesture {
                onTap()
            }
    }
}

struct FlowLayout<Item: Identifiable, Content: View>: View {
    @Binding var items: [Item]
    let content: (Item) -> Content

    var body: some View {
        let rows = generateRows(items: items, containerWidth: UIScreen.main.bounds.width)

        VStack(alignment: .center, spacing: 5) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 5) {
                    ForEach(rows[rowIndex]) { item in
                        content(item)
                    }
                }
            }
        }
        .frame(height: 300)
    }

    private func generateRows(items: [Item], containerWidth: CGFloat) -> [[Item]] {
        var rows: [[Item]] = [[]]
        var currentWidth: CGFloat = 0
        let itemWidth: CGFloat = 100

        for item in items {
            if currentWidth + itemWidth > containerWidth {
                rows.append([])
                currentWidth = 0
            }
            rows[rows.count - 1].append(item)
            currentWidth += itemWidth + 10
        }
        return rows
    }
}



// Voorvertoning
#Preview {
    YouthInterests()
}
