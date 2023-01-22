//
//  ContentView.swift
//  TapTapSudoku
//
//  Created by Francisco Serrano on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var board = Board()
    let spacing = 2.0
    
    var body: some View {
        NavigationStack {
            VStack {
                Grid(horizontalSpacing: 1, verticalSpacing:1) {
                    ForEach(0..<9) { row in
                        GridRow {
                            ForEach(0..<9) { col in
                                Rectangle().fill(.gray)
                                    .aspectRatio(1, contentMode: .fit)
                                if col == 2 || col == 5 {
                                    Spacer()
                                        .frame(width: spacing, height: 1)
                                }
                            }
                        }
                        .padding(.bottom, row == 2 || row == 5 ? spacing : 0)
                    }
                }
                .padding(5)
            }
            .navigationTitle("TapTapSudoku")
        }
        .preferredColorScheme(.dark)
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
