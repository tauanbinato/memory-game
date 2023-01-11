//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(emojiMemoryGameViewModel: game)
        }
    }
}
