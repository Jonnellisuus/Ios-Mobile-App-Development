//
//  MunicipalityView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import SwiftUI

struct MunicipalityView: View {
    @EnvironmentObject var digiTrafficControl: DigiTrafficControl
    let province: String
    
    var body: some View {
        List (digiTrafficControl.municipalityArray, id: \.self) {
            municipality in NavigationLink(destination: CityView(municipality: municipality))  { Image("DigiTrafficIcon").resizable().frame(width: 30, height: 30)
                Text(municipality)
            }
        }
        .onAppear() {
            self.digiTrafficControl.getMunicipality(certainProvince: self.province)
        }
    }
}
