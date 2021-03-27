//
//  CameraData.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import Foundation

struct CameraData: Codable {
    let dataUpdatedTime: String
    let cameraStations: [CameraStation]
}

struct CameraStation: Codable, Identifiable {
    let id: String
    let roadStationID: Int
    let nearestWeatherStationID: Int?
    let cameraPresets: [CameraPreset]

    enum CodingKeys: String, CodingKey {
        case id, cameraPresets
        case roadStationID = "roadStationId"
        case nearestWeatherStationID = "nearestWeatherStationId"
    }
}

struct CameraPreset: Codable, Identifiable {
    let id, imageURL: String
    let presentationName: String?

    enum CodingKeys: String, CodingKey {
        case id, presentationName
        case imageURL = "imageUrl"
    }
}
