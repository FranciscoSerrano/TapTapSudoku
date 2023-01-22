//
//  ContentView.swift
//  TapTapSudoku
//
//  Created by Francisco Serrano on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var board = Board()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
