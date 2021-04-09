//
//  AppView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 9.4.2021.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Image(systemName: "list.dash")
                    Text("Valikko")
                }
            
            InfoView()
                .tabItem { Image(systemName: "info")
                    Text("Tietoja")
            }
        }
    }
}
