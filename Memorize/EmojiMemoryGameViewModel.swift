//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI


class EmojiMemoryGameViewModel: ObservableObject {
    
    /* One Way Of Initializing
    private var model: MemoryGameModel<String> =
    MemoryGameModel<String>(numberOfPairOfCards: 2, cardContentFactory: {
        (pairIndex: Int) -> String in return "👻"
    })
    
    // Same way but shorter
    private var model: MemoryGameModel<String> = MemoryGameModel<String>(numberOfPairOfCards: 2) { _ in "👻" }
     */
    
    private static let emojis: Array<String> =
    ["👻", "🎃", "🕸", "🐥","🐴","🪰","🦞","🛹","🤺","🛼","🏹","🍒","🍎","🍉","🌽"]
    
    // MARK: - Initialize a gate to the model
    // Here we are initializing our 'gate' to the model using our own func that reaturns a MemoryGame<String>
    //
    @Published private var model: MemoryGameModel<String> = EmojiMemoryGameViewModel.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        
        return MemoryGameModel<String>(numberOfPairOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    // MARK: - Intent(s)
    
    func choose(card: MemoryGameModel<String>.Card) {
        return model.choose(card)
    }
}
