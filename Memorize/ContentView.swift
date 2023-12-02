//
//  ContentView.swift
//  Memorize
//
//  Created by Travis Peebles on 11/18/23.
//  Scary Times.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🥶").font(.largeTitle)
            } else {
                base.fill()
            }
        }
    }
}

#Preview {
    ContentView()
}
