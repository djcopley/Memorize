//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // MARK: Themes
    static let themes = [
        Theme(name: "Halloween", items: ["👻", "🦃", "🎃", "🕷", "🕸", "💀", "🧠", "🧟‍♂️", "🧟‍♀️", "🧟", "🐺", "🌙"], color: .orange, pairs: 6),
        Theme(name: "Christmas", items: ["🎄", "🎅🏻", "🤶🏻", "🧑🏻‍🎄", "🎁", "🦌", "🧑🏿‍🎄", "🎅🏿", "🤶🏿", "🧝🏻", "🧝🏻‍♂️", "🧝🏻‍♀️"], color: .green, pairs: 6),
        Theme(name: "People", items: ["👮🏻‍♂️", "👷🏻‍♂️", "🕵🏻‍♂️", "👨🏼‍🏫", "👨🏼‍💻", "👩🏻‍🎨", "🧑🏼‍🚒", "🧑🏻‍🚀", "🥷🏼", "🧙🏼‍♀️", "👨🏽‍⚖️", "👰🏼"], color: .red, pairs: 6),
        Theme(name: "Flags", items: ["🇺🇸", "🇮🇱", "🇯🇵", "🇱🇻", "🇱🇧", "🇭🇳", "🇬🇾", "🇬🇼", "🇱🇾", "🇲🇴", "🇲🇦", "🇲🇿"], color: .purple, pairs: 6),
        Theme(name: "Food", items: ["🍏", "🍎", "🫐", "🍓", "🍌", "🥦", "🍅", "🥐", "🥨", "🍳", "🍔", "🌭"], color: .black, pairs: 6),
        Theme(name: "Animals", items: ["🐶", "🐔", "🙈", "🐮", "🐸", "🐣", "🦇", "🦄", "🦅", "🐝", "🐞", "🦖"], color: .blue, pairs: { Int.random(in: 3..<$0) })
    ]
    
    // MARK: Class Variables
    
    // Initialized with default values that way I can call newEmojiMemoryGame() from init()
    @Published private var model: MemoryGame<String> = MemoryGame()
    var theme = Theme<String>()
    
    //MARK: Functions
    
    init() {
        newEmojiMemoryGame()
    }
    
    func newEmojiMemoryGame() {
        // Randomly choose a theme
        theme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        // Create a new memory game with the randomly selected theme
        model = EmojiMemoryGame.createEmojiMemoryGame(numberOfCardPairs: theme.pairs, emojis: theme.items)
    }
    
    static func createEmojiMemoryGame(numberOfCardPairs: Int, emojis: [String]) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfCardPairs: numberOfCardPairs) { emojis[$0] }
    }
        
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
