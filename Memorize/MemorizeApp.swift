//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
