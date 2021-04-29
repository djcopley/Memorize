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
        VStack {
            Text("\(viewModel.theme.name)").font(.title)
            Text("Score: \(viewModel.score)").font(.headline)
            
            Divider()
            
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .foregroundColor(viewModel.theme.color)
            .padding()
            
            Divider()
            
            Button(action: {viewModel.newEmojiMemoryGame()}) {
                Text("New Game")
            }.font(.title)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        if card.isFaceUp || !card.isMatched {
            GeometryReader { geometry in
                ZStack {
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(110-90), clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(card.content)
                        .padding()
                }
                .font(Font.system(size: fontSize(size: geometry.size)))
                .cardify(isFaceUp: card.isFaceUp)
            }
            .aspectRatio(aspectRatio, contentMode: .fit)
        }
    }
    
    // MARK: Functions
    
    // MARK: Drawing Constants
    private let aspectRatio: CGFloat = 2.0 / 3.0
    private func fontSize(size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.6
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return ContentView(viewModel: game)
    }
}
