//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    /* One Way Of Initializing
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairOfCards: 2, cardContentFactory: {
        (pairIndex: Int) -> String in return "👻"
    })
    
    // Same way but shorter
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairOfCards: 2) { _ in "👻" }
     */
    
    private static let emojis: Array<String> =
    ["👻", "🎃", "🕸", "🐥","🐴","🪰","🦞","🛹","🤺","🛼","🏹","🍒","🍎","🍉","🌽"]
    
    // MARK: - Initialize a gate to the model
    // Here we are initializing our 'gate' to the model using our own func that reaturns a MemoryGame<String>
    //
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        
        return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        return model.choose(card)
    }
}
