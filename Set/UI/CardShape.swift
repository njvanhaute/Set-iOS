//
//  CardShape.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/22/24.
//

import SwiftUI

enum CardShape: Shape {
  case diamond, squiggle, oval

  func path(in rect: CGRect) -> Path {
    switch self {
    case .oval: return Ellipse().path(in: rect)
    case .diamond: return Diamond().path(in: rect)
    case .squiggle: return Rectangle().path(in: rect)
    }
  }
}
