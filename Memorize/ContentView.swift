//
//  ContentView.swift
//  Memorize
//
//  Created by Travis Peebles on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            Text("🥶").font(.largeTitle)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
