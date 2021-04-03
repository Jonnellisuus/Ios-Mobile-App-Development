//
//  ContentView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 15.3.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var digiTrafficControl: DigiTrafficControl
    
    var body: some View {
        Image("DigiTrafficIcon").resizable().frame(width: 70, height: 70)
        NavigationView {
            List{
                ForEach(digiTrafficControl.provinceArray, id: \.self) {
                    province in NavigationLink(destination: MunicipalityView(province: province)) { Image("DigiTrafficIcon").resizable().frame(width: 30, height: 30)
                        Text(province)
                    }
                }
            }
            .onAppear {
                self.digiTrafficControl.getDigiTrafficData()
                self.digiTrafficControl.getCameraData()
            }
        }
    }
}
