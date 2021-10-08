//
//  ContentView.swift
//  Shared
//
//  Created by Joshua Walsh on 9/2/21.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        Book(chapters: [Chapter(id: UUID(), pages: [Page()])])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
