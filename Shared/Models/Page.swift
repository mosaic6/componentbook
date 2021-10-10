//
//  Page.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/8/21.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    @ViewBuilder var content: Content

    let title: String

    var body: some View {
        content
    }
}
