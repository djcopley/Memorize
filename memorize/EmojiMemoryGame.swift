//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createEmojiMemoryGame()
    
    static let numEmojiPairs = Int.random(in: 2..<6)
    static func createEmojiMemoryGame() -> MemoryGame<String> {
        let emojis: ArraySlice<String> = ["👻", "🦃", "🎃", "🤯", "🥵", "👾", "👀", "🤠", "🧠", "🙈", "🐔", "🦋", "🦄"]
            .shuffled()
            .prefix(numEmojiPairs)
        
        return MemoryGame<String>(numberOfCardPairs: emojis.count) { pairIndex in emojis[pairIndex] }
    }
        
    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: Intents
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
