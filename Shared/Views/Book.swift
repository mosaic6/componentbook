//
//  Book.swift
//  ComponentBook (iOS)
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct Book: View {
    var body: some View {
        AllViews()
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
        Text("Hi")
    }
}
