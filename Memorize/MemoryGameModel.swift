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
    
    // - MARK: Computed Proterties
    private var indexOfTheOneAndOnlyOneFaceupCard: Int? {
        get { cards.indices.filter({ index in cards[index].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach({ index in cards[index].isFaceUp = (index == newValue) })}
        
    }
    
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
                    cards[chosenIndex].isFaceUp = true
                } else {
                    indexOfTheOneAndOnlyOneFaceupCard = chosenIndex
                }
                
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

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
