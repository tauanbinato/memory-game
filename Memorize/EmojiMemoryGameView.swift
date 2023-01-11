//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Tauan Binato Flores on 07/01/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiMemoryGameViewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojiMemoryGameViewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            emojiMemoryGameViewModel.choose(card: card)
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
    var card: MemoryGameModel<String>.Card
    
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

struct EmojiMemoryGameView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EmojiMemoryGameView(emojiMemoryGameViewModel: EmojiMemoryGameViewModel())
            .preferredColorScheme(.dark)
        
        EmojiMemoryGameView(emojiMemoryGameViewModel: EmojiMemoryGameViewModel())
            .preferredColorScheme(.light)
    }
}
