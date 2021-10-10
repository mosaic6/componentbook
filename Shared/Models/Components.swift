//
//  Components.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/10/21.
//

import Foundation
import SwiftUI

struct Chapter: Identifiable, Hashable {
    let id = UUID()
    let type: ComponentType
    let pages: [Components]
}

enum ComponentType: String {
    case button
    case textInput
    case card
    case generic
}

/// What does this enum provide?
enum Components: CaseIterable, Identifiable {
    var id: UUID {
        UUID()
    }

    case headerView
    case reallyCoolButton
    case dashboardView
    case alternativeButton

    /// Title shown in navigation list76
    var title: String {
        switch self {
            case .headerView: return "Header View"
            case .reallyCoolButton: return "Really Cool Button"
            case .dashboardView: return "Dashboard"
            case .alternativeButton: return "Alternative Button"
        }
    }

    var view: AnyView {
        switch self {
            case .headerView: return AnyView(HeaderView())
            case .reallyCoolButton: return AnyView(ReallyCoolButton())
            case .dashboardView: return AnyView(DashboardCardSmall())
            case .alternativeButton: return AnyView(EmptyView())
        }
    }

    @ViewBuilder func viewBuilder() -> some View {
        VStack {
            switch self {
                case .headerView:
                    HeaderView()
                case .reallyCoolButton:
                    ReallyCoolButton()
                case .alternativeButton:
                    EmptyView()
                case .dashboardView:
                    DashboardCardSmall()
            }
        }
    }
}
