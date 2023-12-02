//
//  ContentView.swift
//  Memorize
//
//  Created by Travis Peebles on 11/18/23.
//  Scary Times.
//

import SwiftUI

struct ContentView: View {
    let emojisF = ["🥶","🤪", "😀", "😂", "😊", "😎", "😍", "🤩", "😜", "😇", "🤗", "🤔"]
    let emojisC = ["🧑‍🎄", "🎄", "🎁", "💸", "🤶", "🎅🏼"]
    let emojisH = ["💀", "👻", "🎃", "🍭", "😱", "👺"]
    
    @State private var selection = "emojisF"
    let theme = ["Faces", "Christmas", "Halloween"]
    let themeSymbol = ["face.smiling", "gift", "moonset"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojisF[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }
    
    var themeChooser: some View {
        Picker("Select theme", selection: $selection) {
            ForEach(0..<theme.count, id: \.self) { index in
                HStack {
                    Image(systemName: themeSymbol[index])
                    Text(theme[index])
                }
            }
        }.pickerStyle(.menu)
        
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            themeChooser
            Spacer()
            cardAdder
        }.imageScale(.large).font(.title)
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojisF.count)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
