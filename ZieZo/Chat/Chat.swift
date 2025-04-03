//
//  Chat.swift
//  ZieZo
//
//  Created by Karlijn van den Herik on 03/04/2025.
//

import Foundation

import SwiftUI

struct ChatView: View {
    @State private var messages: [Message] = [
        Message(text: "Hallo! Wat leuk dat we zijn gematched", isUser: false)
    ]
    
    @State private var autoMessages = [
        "Welke sporten doet u?",
        "Wat is uw favoriete herinnering van vroeger?",
        "Wilt u videobellen?"
    ]
    
    @State private var suggestedReplies = [
        "Hallo, ik ben Geert!",
        "Ik heb vroeger veel parachute gesprongen",
        "Ik hou van een potje voetbal",
    ]
    
    @State private var messageIndex = 0
    
    var body: some View {
        ZStack {
            Image("BackgroundElders")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
              
                HStack{
                    Button(action: {
                                          
                                      }) {
                                          Image(systemName: "arrow.left")
                                              .font(.largeTitle)
                                              .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                                      }
                                      .padding(.leading)
                    Spacer()
                    
                    Image("SanneImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                        .padding(5)
                    
                    Text("Sanne")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                        .padding(5)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "video.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 12/255, green: 8/255, blue: 80/255))
                            .cornerRadius(10)
                            .frame(width: 100, height: 100)
                            .padding(.trailing, 20)
                    }
                    
                    
                   
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                }
                
                if !suggestedReplies.isEmpty {
                    HStack {
                        ForEach(suggestedReplies, id: \.self) { reply in
                            Button(action: {
                                sendMessage(reply)
                            }) {
                                Text(reply)
                                    .padding()
                                    .font(.title2)
                                    .background(Color(red: 12/255, green: 8/255, blue: 80/255))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                startAutoMessages()
            }
        }
    }
    
    // Stuur een bericht en voeg toe aan chat
    func sendMessage(_ text: String) {
        messages.append(Message(text: text, isUser: true))
        
        // Simuleer een vertraging voordat de bot antwoordt
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if messageIndex < autoMessages.count {
                messages.append(Message(text: autoMessages[messageIndex], isUser: false))
                messageIndex += 1
            }
        }
    }
    
    // Start de automatische berichten
    func startAutoMessages() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            if messageIndex < autoMessages.count {
                messages.append(Message(text: autoMessages[messageIndex], isUser: false))
                messageIndex += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            Text(message.text)
                .padding()
                .font(.title)
                .background(message.isUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.isUser ? .white : .black)
                .cornerRadius(10)
            if !message.isUser {
                Spacer()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
