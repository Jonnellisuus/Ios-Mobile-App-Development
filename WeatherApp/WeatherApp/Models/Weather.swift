//
//  Weather.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 20.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import Foundation

struct Weather: Codable {
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    let clouds: Clouds
    let sys: Sys
}
struct Coord: Codable {
    let lon, lat: Double
}
struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}
struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}
struct Clouds: Codable {
    let all: Double
}
struct Sys: Codable {
    let id: Int
    let type: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
