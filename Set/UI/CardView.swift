//
//  CardView.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    let color: Color
    let shape: CardShape
    let shadowColor: Color
    
    init(_ card: SetGame.Card, shadowColor: Color) {
        self.card = card
        let colorMap: [SetGame.Card.Color: Color] = [.red : .red, .green : .green, .purple : .purple]
        self.color = colorMap[card.color]!
        let shapeMap: [SetGame.Card.Shape : CardShape] = [.diamond : .diamond, .squiggle: .squiggle, .oval : .oval]
        self.shape = shapeMap[card.shape]!
        self.shadowColor = shadowColor
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                shapeStack.padding(8)
            }
            .offset(x: 0, y: card.selected ? Constants.offsetWhenSelected : 0)
            .shadow(color: shadowColor, radius: card.selected ? Constants.shadowRadiusWhenSelected : 0)
        }
    }
    
    var shapeStack: some View {
        VStack {
            ForEach(0..<card.number, id: \.self) { _ in
                applyShading(to: shape)
            }
        }
    }
    
    @ViewBuilder
    func applyShading(to shape: CardShape) -> some View {
        if card.shading == .open {
            shape.stroke(color)
        } else if card.shading == .solid {
            shape.fill(color)
        } else {
            shape.fill(color).opacity(0.4)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        static let offsetWhenSelected: CGFloat = -10
        static let shadowRadiusWhenSelected: CGFloat = 3
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
    }
}

#Preview {
    CardView(SetGame.Card(id: 1, number: 3, shading: .solid, color: .purple, shape: .diamond), shadowColor: .green)
        .padding()
}
