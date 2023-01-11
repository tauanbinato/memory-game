//
//  ContentView.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                    }
                }
            }
            
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
        Spacer()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
            }
            else if card.isMatched{
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }.aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
        
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.light)
    }
}
