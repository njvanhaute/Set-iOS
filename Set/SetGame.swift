//
//  SetGame.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import Foundation

struct SetGame {
    private(set) var deck: Array<Card>
    private(set) var score: Int
    
    init() {
        deck = []
        score = 0
        var cardId = 1
        for n in 1...3 {
            for shading in Card.Shading.allCases {
                for color in Card.Color.allCases {
                    for shape in Card.Shape.allCases {
                        deck.append(Card(id: cardId, number: n, shading: shading, color: color, shape: shape))
                        cardId += 1
                    }
                }
            }
        }
        
        deal(12)
    }
    
    mutating func deal(_ n: Int) {
        if let firstUndealtIndex = deck.firstIndex(where: { !$0.dealt }) {
            for i in firstUndealtIndex..<firstUndealtIndex+n {
                deck[i].dealt = true
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = deck.firstIndex(where: { $0.id == card.id }) {
            if selectedCardsOnTable.count == 3 && cardsAreASet(selectedCardsOnTable) {
                replaceSelectedWithNew()
            }
            
            if card.selected || !card.selected && selectedCardsOnTable.count < 3 {
                deck[chosenIndex].selected.toggle()
            }
        }
        
        print(selectedCardsOnTable)
    }
    
    mutating func replaceSelectedWithNew() {
        for i in deck.indices {
            if deck[i].selected {
                deck[i].selected = false
                deck[i].inPlay = false
            }
        }
        
        deal(3)
    }
    
    func cardsAreASet(_ cards: Array<Card>) -> Bool {
        if cards.count != 3 { return false }
        var numberSet = Set<Int>()
        var shadingSet = Set<Card.Shading>()
        var colorSet = Set<Card.Color>()
        var shapeSet = Set<Card.Shape>()
        
        cards.forEach {
            numberSet.insert($0.number)
            shadingSet.insert($0.shading)
            colorSet.insert($0.color)
            shapeSet.insert($0.shape)
        }
        
        return numberSet.count != 2 && shadingSet.count != 2 && colorSet.count != 2 && shapeSet.count != 2
    }
    
    var cardsOnTable: Array<Card> {
        deck.filter { $0.dealt && $0.inPlay }
    }
    
    var selectedCardsOnTable: Array<Card> {
        cardsOnTable.filter { $0.selected }
    }
    
    var cardsInPlay: Array<Card> {
        deck.filter { $0.inPlay }
    }
    
    struct Card: CustomDebugStringConvertible, Equatable, Identifiable {
        var id: Int
        
        enum Shape: String, CaseIterable {
            case diamond
            case squiggle
            case oval
        }
        
        enum Shading: String, CaseIterable {
            case solid
            case striped
            case open
        }
        
        enum Color: String, CaseIterable {
            case red
            case green
            case purple
        }
        
        let number: Int
        let shading: Shading
        let color: Color
        let shape: Shape
        
        var selected = false
        var inPlay = true
        var dealt = false
        
        var debugDescription: String {
            "\(number) \(shading) \(color) \(shape)\(number > 1 ? "s" : "")"
        }
    }
}
