//
//  CalculatorTaskApp.swift
//  CalculatorTask
//
//  Created by Jonne Kiukas on 12.3.2021.
//

import SwiftUI

@main
struct CalculatorTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
