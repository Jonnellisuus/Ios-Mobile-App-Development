//
//  ModelData.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 9.4.2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var digiTraffic: [DigiTraffic] = load("DigiTraffic.json")
    @Published var showFavoritesOnly = false
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}