//
//  ContentView.swift
//  Memorize
//
//  Created by Travis Peebles on 11/18/23.
//  Scary Times.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🥶", "👻", "🔫", "🎯", "🤪", "😀", "😂", "😊", "😎", "😍", "🤩", "😜", "😇", "🤗", "🤔"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjuster
        }
        .padding()
    }
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large).font(.title)
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
