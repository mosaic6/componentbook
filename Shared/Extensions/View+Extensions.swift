//
//  View+Extensions.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import Foundation
import SwiftUI

extension View {

    #if DEBUG
    func previewDependencies() -> some View {
        self
            .environmentObject(Theme())
    }
    #endif
}

