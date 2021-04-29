//
//  Theme.swift
//  memorize
//
//  Created by Daniel Copley on 4/28/21.
//

import Foundation
import SwiftUI

struct Theme<Content> {
    // Keep a list of the items and shuffle them when returning to user
    private var privateItems: [Content] = []
    // Generate a new number of pairs
    private var numPairsGenerator: () -> Int = { 0 }

    var name: String
    var items: [Content] {
        get {
            privateItems.shuffled()
        }
        set {
            privateItems = newValue
        }
    }
    var color: Color
    var pairs: Int {
        get {
            numPairsGenerator()
        }
        set {
            numPairsGenerator = { newValue }
        }
    }
    
    init() {
        name = ""
        privateItems = []
        color = .black
        pairs = 0
    }
    
    init(name: String, items: [Content], color: Color) {
        self.name = name
        self.privateItems = items
        self.color = color
        self.pairs = items.count
    }
    
    init(name: String, items: [Content], color: Color, pairs: Int) {
        self.name = name
        self.privateItems = items
        self.color = color
        self.pairs = pairs
    }
    
    init(name: String, items: [Content], color: Color, pairs: @escaping (Int) -> Int) {
        self.name = name
        self.privateItems = items
        self.color = color
        self.numPairsGenerator = { pairs(items.count) }
    }
}
