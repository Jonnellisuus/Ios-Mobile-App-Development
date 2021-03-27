//
//  DigiTrafficApp.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 15.3.2021.
//

import SwiftUI

@main
struct DigiTrafficApp: App {
    var digiTrafficControl = DigiTrafficControl()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(digiTrafficControl)
        }
    }
}
