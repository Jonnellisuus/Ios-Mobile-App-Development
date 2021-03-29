//
//  CityView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import SwiftUI

struct CityView: View {
    @EnvironmentObject var digiTrafficControl: DigiTrafficControl
    let municipality: String
    
    var body: some View {
        List(digiTrafficControl.road, id: \.self) {
            road in NavigationLink(destination: RoadView(roadView: road)) { Image("DigiTrafficIcon").resizable().frame(width: 30, height: 30)
                Text(road)
            }
        }
        .onAppear() {
            self.digiTrafficControl.getRoad(certainMunicipality: self.municipality)
        }
    }
}
