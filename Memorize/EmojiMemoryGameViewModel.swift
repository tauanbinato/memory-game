//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI


class EmojiMemoryGameViewModel: ObservableObject {
    
    typealias Card = MemoryGameModel<String>.Card
    
    /* One Way Of Initializing
    private var model: MemoryGameModel<String> =
    MemoryGameModel<String>(numberOfPairOfCards: 2, cardContentFactory: {
        (pairIndex: Int) -> String in return "ðŧ"
    })
    
    // Same way but shorter
    private var model: MemoryGameModel<String> = MemoryGameModel<String>(numberOfPairOfCards: 2) { _ in "ðŧ" }
     */
    
    private static let emojis: Array<String> =
    ["ðŧ", "ð", "ðļ", "ðĨ","ðī","ðŠ°","ðĶ","ðđ","ðĪš","ðž","ðđ","ð","ð","ð","ð―"]
    
    // MARK: - Initialize a gate to the model
    // Here we are initializing our 'gate' to the model using our own func that reaturns a MemoryGame<String>
    //
    @Published private var model = EmojiMemoryGameViewModel.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        
        return MemoryGameModel<String>(numberOfPairOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    var cards: Array<Card> {
        return model.cards
    }
    // MARK: - Intent(s)
    
    func choose(card: Card) {
        return model.choose(card)
    }
}

