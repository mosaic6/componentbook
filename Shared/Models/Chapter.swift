//
//  Chapter.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/12/21.
//

import Foundation
import SwiftUI

struct Chapter: Identifiable, Hashable {
    let id = UUID()
    let type: ComponentType
    let pages: [Components]
}
