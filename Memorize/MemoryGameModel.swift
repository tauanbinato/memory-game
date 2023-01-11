//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    // - MARK: Properties
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyOneFaceupCard: Int?
    
    // - MARK: Initializers
    init (numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    // - MARK: Mutations
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp ,
           !cards[chosenIndex].isMatched
        {
                if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceupCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true;
                        cards[potentialMatchIndex].isMatched = true;
                    }
                    indexOfTheOneAndOnlyOneFaceupCard = nil
                } else {
                    for index in cards.indices {
                        cards[index].isFaceUp = false
                    }
                    indexOfTheOneAndOnlyOneFaceupCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp.toggle()
        }
    }

    // - MARK: Structures
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}