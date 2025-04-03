//
//  ChatModel.swift
//  ZieZo
//
//  Created by Karlijn van den Herik on 03/04/2025.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool 
}

