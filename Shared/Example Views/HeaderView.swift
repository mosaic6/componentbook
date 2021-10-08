//
//  HeaderView.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Example header component")
                .bold()
                .padding(.vertical, 30)
        }
    }
}

#if DEBUG
struct HeaderView_Previews: PreviewProvider, Previewable {
    static var layout: PreviewLayout {
        .device
    }

    static var environmentColor: ColorScheme {
        .dark
    }

    static var previews: some View {
        HeaderView_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "someMessage", viewModel: "")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        HeaderView()
    }
}
#endif
