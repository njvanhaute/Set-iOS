//
//  SetViewModel.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import Foundation

class SetViewModel: ObservableObject {
    
    @Published private var model: SetGame
    
    init() {
        model = SetGame()
    }
    
    func startNewGame() {
        model = SetGame()
    }
    
    func choose(_ card: SetGame.Card) {
        model.choose(card)
    }
    
    func dealThreeMoreCards() {
        let selected = model.selectedCardsOnTable
        if selected.count == 3 && model.cardsAreASet(selected) {
            model.replaceSelectedWithNew()
            return
        }
        model.deal(3)
    }
    
    var cardsOnTable: Array<SetGame.Card> {
        model.cardsOnTable
    }
    
    var allCardsDealt: Bool {
        model.deck.filter{ !$0.dealt }.isEmpty
    }
}
