//
//  CardView.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    
    init(_ card: SetGame.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.debugDescription)
                    .font(.system(size: 18))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .offset(x: 0, y: card.selected ? -10 : 0)
            .shadow(radius: card.selected ? 3 : 0)
        }
    }
}

#Preview {
    CardView(SetGame.Card(id: 1, number: 3, shading: .solid, color: .red, shape: .diamond))
        .padding()
}
