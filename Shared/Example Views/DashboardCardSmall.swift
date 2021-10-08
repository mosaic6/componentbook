//
//  DashboardCardSmall.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct DashboardCardSmall: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "square.and.arrow.down")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.white)
            Text("Deposit")
                .font(.caption)
                .foregroundColor(.white)
        }
        .frame(width: 80, height: 80)
        .background(Color.orange)
        .cornerRadius(10.0)
    }
}

#if DEBUG
struct DashboardCardSmall_Previews: PreviewProvider, Previewable {
    static var layout: PreviewLayout {
        .sizeThatFits
    }

    static var environmentColor: ColorScheme {
        .dark
    }

    static var previews: some View {
        DashboardCardSmall_Previews.debugPreviews
    }

    static var defaultViewModel: PreviewData<String> {
        PreviewData(id: "reallyCoolButton", viewModel: "")
    }

    static var alternateViewModels: [PreviewData<String>] {
        []
    }

    static func create(from viewModel: String) -> some View {
        DashboardCardSmall()
    }
}
#endif
