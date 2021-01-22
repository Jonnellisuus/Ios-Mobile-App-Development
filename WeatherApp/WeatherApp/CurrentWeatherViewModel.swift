//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 20.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import Foundation
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: WeatherData?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(by city: String = "Lappeenranta") {
        WeatherApi.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
