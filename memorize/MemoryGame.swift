//
//  MemoryGame.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Int
    
    private var indexOfOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                if cards[index].isFaceUp {
                    cards[index].seen = true
                }
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init() {
        cards = [Card]()
        score = 0
    }
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        score = 0
        
        for pairIndex in 0..<numberOfCardPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
        
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    // Increase score by two because cards match
                    score += 2
                } else {
                    // Mismatched case
                    // Subtract one for each previously seen card
                    score -= (cards[chosenIndex].seen ? 1 : 0) + (cards[potentialMatchIndex].seen ? 1 : 0)
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var seen: Bool = false
        var content: CardContent
        var id: Int
    }
}
