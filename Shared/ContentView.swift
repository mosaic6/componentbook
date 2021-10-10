//
//  ContentView.swift
//  Shared
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

struct Views: Identifiable {
    let id = UUID()
    var views: [AnyView] = []

    init(views: [AnyView]) {
        self.views = views
    }
}

struct AllViews: View {
    /// Views to be added
    var views: [Any] = [
        HeaderView.self,
        ReallyCoolButton.self,
        DashboardCardSmall.self
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<views.count) { index in
                    NavigationLink(viewTitles(views: self.views, index: index), destination: self.buildView(views: self.views, index: index))
                }
            }
        }
    }

    /// Title to be shown in navigation list
    func viewTitles(views: [Any], index: Int) -> String {
        switch views[index].self {
            case is HeaderView.Type: return "Header View"
            case is ReallyCoolButton.Type: return "Really Cool Button"
            case is DashboardCardSmall.Type: return "Dashboard card"
            default: return ""
        }
    }

    func buildView(views: [Any], index: Int) -> AnyView {
        switch views[index].self {
            case is HeaderView.Type: return AnyView(HeaderView())
            case is ReallyCoolButton.Type: return AnyView(ReallyCoolButton())
            case is DashboardCardSmall.Type: return AnyView(DashboardCardSmall())
            default: return AnyView(EmptyView())
        }
    }
}

struct ContentView: View {
    var body: some View {
        Book()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
