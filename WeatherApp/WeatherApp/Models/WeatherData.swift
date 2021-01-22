//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 22.1.2021.
//

import Foundation

struct WeatherData: Codable {
    let name, base: String
    let coord: Coord
    let main: Main
    let sys: Sys
    let weather: [Weather]
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}

struct Sys: Codable {
    let id: Int
    let type: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
