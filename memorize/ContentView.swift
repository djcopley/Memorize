//
//  ContentView.swift
//  memorize
//
//  Created by Daniel Copley on 4/25/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeWidth)
                    Text(card.content).padding()
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(size: geometry.size)))
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
    }
    
    // MARK: Functions
    
    // MARK: Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let aspectRatio: CGFloat = 2.0 / 3.0
    let strokeWidth: CGFloat = 3.0
    func fontSize(size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.6
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel:  EmojiMemoryGame())
        }
    }
}
