//
//  TodoeyApp.swift
//  Todoey
//
//  Created by allan galdino on 02/10/21.
//

import SwiftUI

@main
struct TodoeyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
