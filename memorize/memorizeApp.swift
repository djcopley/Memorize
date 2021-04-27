//
//  MemorizeApp.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
