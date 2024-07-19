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
    
    init(_ card: SetGame.Card) {
        self.card = card
        let colorMap: [SetGame.Card.Color: Color] = [.red : .red, .green : .green, .purple : .purple]
        self.color = colorMap[card.color]!
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Diamond()
                    .fill(color)
                    .padding(8)
            }
            .offset(x: 0, y: card.selected ? Constants.offsetWhenSelected : 0)
            .shadow(radius: card.selected ? Constants.shadowRadiusWhenSelected : 0)
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
    CardView(SetGame.Card(id: 1, number: 3, shading: .solid, color: .purple, shape: .diamond))
        .padding()
}
