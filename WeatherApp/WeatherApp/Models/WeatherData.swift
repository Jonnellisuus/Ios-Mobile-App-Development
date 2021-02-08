//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 22.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let coord: Coord
    let main: Main
    let weather: [Weather]
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Main: Codable {
    let temp: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let main: String
    let icon: String
}
