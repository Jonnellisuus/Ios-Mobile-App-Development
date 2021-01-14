//
//  landmarkApp.swift
//  Shared
//
//  Created by Jonne Kiukas on 11.1.2021.
//

import SwiftUI

@main
struct landmarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
