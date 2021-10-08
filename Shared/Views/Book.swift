//
//  Book.swift
//  ComponentBook (iOS)
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct Page: Hashable, View {
    @ViewBuilder var view: some View {
        AnyView(self)
    }
}

struct Book: View {
    let chapters: [Chapter]
    var body: some View {
        NavigationView {
            ForEach(chapters, id: \.self) { chapter in
                ForEach(chapter.pages, id: \.self) { page in
                    NavigationLink("Element", destination: page)
                }
//            switch chapter {
//                case .some(let view):
//                    NavigationLink("view", destination: view)
//                case .none:
//                    EmptyView()
            }
        }
    }
}

struct Book_Preview: PreviewProvider, Previewable {
    static var layout: PreviewLayout {
        .sizeThatFits
    }

    static var environmentColor: ColorScheme {
        .dark
    }

    static var previews: some View {
        Book_Preview.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "Book", viewModel: "")
    }

    static var alternateViewModels: [PreviewData<String>] {
        [PreviewData(id: "Book", viewModel: ""),
         PreviewData(id: "Book", viewModel: ""),
         PreviewData(id: "Book", viewModel: "")]
    }

    static func create(from viewModel: String) -> some View {
        Book(chapters: [Chapter(id: UUID(), pages: [Page()])])
    }
}
