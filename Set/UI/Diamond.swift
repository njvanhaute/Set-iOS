//
//  Diamond.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        let width: CGFloat = 0.7
        
        let p1 = CGPoint(x: rect.midX, y: rect.maxY)
        let p2 = CGPoint(x: (1 + width) * rect.midX, y: rect.midY)
        let p3 = CGPoint(x: rect.midX, y: rect.minY)
        let p4 = CGPoint(x: (1 - width) * rect.midX, y: rect.midY)
        
        p.addLines([p1, p2, p3, p4, p1])
        
        return p
    }
}
