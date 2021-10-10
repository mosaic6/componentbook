//
//  Components.swift
//  ComponentBook
//
//  Created by Joshua Walsh on 10/10/21.
//

import Foundation
import SwiftUI

enum Components: CaseIterable {
    case headerView
    case reallyCoolButton
    case dashboardView

    var allComponents: Any {
        switch self {
            case .headerView: return HeaderView.self
            case .reallyCoolButton: return ReallyCoolButton.self
            case .dashboardView: return DashboardCardSmall.self
        }
    }

    var title: String {
        switch self {
            case .headerView: return "Header View"
            case .reallyCoolButton: return "Really Cool Button"
            case .dashboardView: return "Dashboard"
        }
    }

    var view: AnyView {
        switch self {
            case .headerView: return AnyView(HeaderView())
            case .reallyCoolButton: return AnyView(ReallyCoolButton())
            case .dashboardView: return AnyView(DashboardCardSmall())
        }
    }

    /// Title to be shown in navigation list
//    func viewTitles(views: [Any], index: Int) -> String {
//        switch views[index].self {
//            case is HeaderView.Type: return "Header View"
//            case is ReallyCoolButton.Type: return "Really Cool Button"
//            case is DashboardCardSmall.Type: return "Dashboard card"
//            default: return ""
//        }
//    }

//    func buildView(views: [Any], index: Int) -> AnyView {
//        switch views[index].self {
//            case is HeaderView.Type: return AnyView(HeaderView())
//            case is ReallyCoolButton.Type: return AnyView(ReallyCoolButton())
//            case is DashboardCardSmall.Type: return AnyView(DashboardCardSmall())
//            default: return AnyView(EmptyView())
//        }
//    }
}
