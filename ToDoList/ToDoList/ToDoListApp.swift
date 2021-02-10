//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jonne Kiukas on 10.2.2021.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
