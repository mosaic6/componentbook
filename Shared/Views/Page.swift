//
//  Page.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/10/21.
//

import SwiftUI

struct Pages: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Components.allCases, id: \.self) { view in
                    NavigationLink(view.title, destination: view.view)
                }
            }
        }
    }
}
