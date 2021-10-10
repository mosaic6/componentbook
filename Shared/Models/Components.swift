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

/// The type in which to categorize a view
enum ComponentType: String {
    case button
    case textInput
    case card
    case generic
}

/// Individual views and respective information
enum Components: CaseIterable, Identifiable {
    var id: UUID {
        UUID()
    }

    case headerView
    case reallyCoolButton
    case dashboardView
    case alternativeButton

    /// Title shown in navigation list
    var title: String {
        switch self {
            case .headerView: return "Header View"
            case .reallyCoolButton: return "Really Cool Button"
            case .dashboardView: return "Dashboard"
            case .alternativeButton: return "Alternative Button"
        }
    }

    /// Additional information about each component
    var description: String {
        switch self {
            case .headerView: return ""
            case .reallyCoolButton: return ""
            case .dashboardView: return ""
            case .alternativeButton: return ""
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

    /// Helper function to layout page view for components
    @ViewBuilder func viewBuilder() -> some View {
        VStack(spacing: 30) {
            Text(self.title)
            view
        }
    }
}
