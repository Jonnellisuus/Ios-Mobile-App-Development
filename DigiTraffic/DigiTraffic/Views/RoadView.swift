//
//  RoadView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import SwiftUI

struct RoadView: View {
    @EnvironmentObject var digiTrafficControl: DigiTrafficControl
    let roadView: String
    
    var body: some View {
        List(digiTrafficControl.roads) { road in
            NavigationLink(destination: CameraView(imageUrl: URL(string: road.imageUrl)!)) {
                Text(road.presentationName ?? "404 name not found.")
            }
        }
        .onAppear() {
            self.digiTrafficControl.getPreset(roadId: self.roadView)
        }
    }
}
