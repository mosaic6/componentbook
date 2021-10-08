//
//  ReallyCoolButton.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct ReallyCoolButton: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Wow, this is awesome!")
            }, label: {
                Text("Button")
            })
        }
    }
}

struct ReallyCoolButton_Previews: PreviewProvider, Previewable {
    static var layout: PreviewLayout {
        .sizeThatFits
    }

    static var environmentColor: ColorScheme {
        .dark
    }

    static var previews: some View {
        ReallyCoolButton_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "reallyCoolButton", viewModel: "")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        ReallyCoolButton()
    }
}
