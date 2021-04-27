//
//  MemoryGame.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards : Array<Card>
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfCardPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if card.id == cards[index].id {
                return index
            }
        }
        return NSNotFound // TODO: Fix this later
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
