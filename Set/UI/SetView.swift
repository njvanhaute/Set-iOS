//
//  SetView.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import SwiftUI

struct SetView: View {
    @ObservedObject var viewModel: SetViewModel
    
    private let cardAspectRatio: CGFloat = 2/3
    
    init(_ viewModel: SetViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            titleText
            cards
                .animation(.default, value: viewModel.cardsOnTable)
            Spacer()
            dealButton
            newGameButton
        }
        .padding()
    }
    
    var titleText: some View {
        Text("Set")
            .font(.largeTitle)
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cardsOnTable, aspectRatio: cardAspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
    var dealButton: some View {
        Button("Deal 3 More Cards") {
            viewModel.dealThreeMoreCards()
        }
        .disabled(viewModel.allCardsDealt)
    }
    
    var newGameButton: some View {
        Button("New Game") {
            viewModel.startNewGame()
        }
    }
}

#Preview {
    SetView(SetViewModel())
}
