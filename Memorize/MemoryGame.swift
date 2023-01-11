//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init (numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    mutating func choose(_ card: Card){
        let chosenIndex = indexOf(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func indexOf(of: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == of.id {
                return index
            }
        }
        return 0
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
