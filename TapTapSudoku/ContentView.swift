//
//  ContentView.swift
//  TapTapSudoku
//
//  Created by Francisco Serrano on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var board = Board()
    @State private var selectedRow = -1
    @State private var selectedCol = -1
    @State private var selectedNum = 0
    let spacing = 2.0
    
    func highlightState(for row: Int, col: Int) -> CellView.HighlightState {
        if row == selectedRow {
            if col == selectedCol {
                return .selected
            } else {
                return .highlighted
            }
        } else if col == selectedCol {
            return .highlighted
        } else {
            return .standard
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Grid(horizontalSpacing: 1, verticalSpacing:1) {
                    ForEach(0..<9) { row in
                        GridRow {
                            ForEach(0..<9) { col in
                                CellView(number: board.playerBoard[row][col], selectedNumber: selectedNum, highlightState: highlightState(for: row, col: col), isCorrect: board.playerBoard[row][col] == board.fullBoard[row][col]) {
                                    selectedRow = row
                                    selectedCol = col
                                    selectedNum = board.playerBoard[row][col]
                                }
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
