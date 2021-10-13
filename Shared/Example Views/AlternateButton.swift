//
//  AlternateButton.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/12/21.
//

import Foundation
import SwiftUI

struct AlternateButton: View {
    var body: some View {
        VStack {
            Text("This is an awesome button")
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}
