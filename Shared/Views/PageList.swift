//
//  PageList.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/10/21.
//

import SwiftUI

struct PageList: View {

    let chapters: [Chapter] = [
        .init(type: .generic, pages: [.headerView]),
        .init(type: .button, pages: [.reallyCoolButton, .alternativeButton]),
        .init(type: .card, pages: [.dashboardView])
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(chapters, id: \.self.type) { chapter in
                    Section(header: Text(chapter.type.rawValue.uppercased())) {
                        ForEach(chapter.pages, id: \.self) { page in
                            NavigationLink(page.title, destination: page.viewBuilder())
                        }
                    }
                }
            }
            #if os(macOS)
            .listStyle(DefaultListStyle())
            #endif
            #if os(iOS)
            .listStyle(GroupedListStyle())
            #endif
        }
    }
}
