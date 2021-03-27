//
//  DigiTrafficData.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 15.3.2021.
//

import Foundation

struct DigiTrafficData: Decodable {
    let features: [Feature]
}

struct Feature: Decodable, Identifiable {
    let id: String
    let properties: Property
    
    enum CodingKeys: String, CodingKey {
        case id, properties
    }
}

struct Property: Decodable, Identifiable {
    let id, municipality, province: String
    let names: Names
    let presets: [Preset]

    enum CodingKeys: String, CodingKey {
        case id, municipality, province, names, presets
    }
}

struct Names: Decodable {
    let fi: String?
}

struct Preset: Decodable, Identifiable {
    let id = UUID()
    let presentationName: String?
    let imageUrl: String
}
