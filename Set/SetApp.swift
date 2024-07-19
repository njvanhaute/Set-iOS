//
//  SetApp.swift
//  Set
//
//  Created by Nicholas Vanhaute on 7/19/24.
//

import SwiftUI

@main
struct SetApp: App {
    @StateObject var viewModel = SetViewModel()
    
    var body: some Scene {
        WindowGroup {
            SetView(viewModel)
        }
    }
}
