//
//  ZieZoApp.swift
//  ZieZo
//
//  Created by Karlijn van den Herik on 01/04/2025.
//

import SwiftUI

@main
struct ZieZoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                LoadingScreen()
            }
        }
    }
}
