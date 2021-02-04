//
//  MenuListApp.swift
//  MenuList
//
//  Created by Jonne Kiukas on 4.2.2021.
//

import SwiftUI

@main
struct MenuListApp: App {
    @StateObject private var order = Order()
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
