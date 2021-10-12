//
//  Theme.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import Foundation
import SwiftUI

/// Custom theme object for colors, etc.
class Theme: ObservableObject {
    // Colors
    @Published var devBackground: LinearGradient = LinearGradient(gradient: Gradient(colors: [.yellow, .orange, .red]), startPoint: .top, endPoint: .bottom)
    @Published var altDevBackground: LinearGradient = LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
}
