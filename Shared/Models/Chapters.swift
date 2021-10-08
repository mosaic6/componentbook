//
//  Chapters.swift
//  ComponentBook (iOS)
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI

protocol CustomStringConvertable {
    var title: String { get }
    var description: String? { get }
}

struct Chapter: Hashable {
    var id: UUID = UUID()
    var pages: [Page]
}

//enum Chapter<V: View>: CaseIterable, CustomStringConvertable, Identifiable {
//    static var allCases: [Chapter<V>] {
//        return [.some(V.self as! V), .none]
//    }
//
//    var id: UUID? {
//        return UUID()
//    }
//
//    case some(V)
//    case none
//
//    /// The title shown in the navigation menu
//    var title: String {
//        switch self {
//            case .some:
//                /**
//                 Example:
//                 return view is HeaderView ? "HeaderView" : ""
//                 */
//                return ""
//
//            case .none:
//                return ""
//        }
//    }
//
//    var description: String? {
//        switch self {
//            case .some, .none:
//                return nil
//        }
//    }
//
//    @ViewBuilder var view: some View {
//        switch self {
//            case .some(let v):
//                VStack {
//                    Text(description ?? "")
//                        .font(.footnote)
//                        .padding()
//                    Spacer()
//                    v
//                    Spacer()
//                }
//            case .none:
//                EmptyView()
//        }
//    }
//}
