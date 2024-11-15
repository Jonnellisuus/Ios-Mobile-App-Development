//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 20.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var specificWeather = CurrentWeatherViewModel()
    @State var city: String = ""
    
    var body: some View {
            VStack() {
                TextField("Enter your city", text: $city, onCommit:  {
                    self.specificWeather.fetch(by: self.city)
                }).padding(.horizontal)
                
                GeometryReader{ gr in
                CurrentWeather(specificWeather: self.specificWeather.current, height: self.selected == 0 ? gr.size.height : gr.size.height * 0.50).animation(.easeInOut(duration: 0.5))
            }
        }
    }
}

extension Double {
    var round: Int {
        return Int(self)
    }
}
