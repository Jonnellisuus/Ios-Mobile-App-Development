//
//  DigiTrafficControl.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import Foundation

class DigiTrafficControl: ObservableObject {
    
    // "https://tie.digitraffic.fi/api/v3/metadata/camera-stations"
    @Published var digiTrafficData = [Feature]()
    
    // "https://tie.digitraffic.fi/api/v1/data/camera-data"
    @Published var cameraStations = [CameraStation]()
    
    @Published var imageUrl: [String] = []
    @Published var cameraPreset: [CameraPreset] = []
    
    @Published var roads: [Preset] = []
    @Published var road: [String] = []
    
    var municipality: Set<String> = []
    @Published var municipalityArray: [String] = []
    
    var province: Set<String> = []
    @Published var provinceArray: [String] = []
    
    func getDigiTrafficData() {
        if let digiTrafficUrl = URL(string: "https://tie.digitraffic.fi/api/v3/metadata/camera-stations") {
            let urlSession = URLSession(configuration: .default)
            let getData = urlSession.dataTask(with: digiTrafficUrl) { (data, response, error) in
                if error == nil {
                    let jsonDecoder = JSONDecoder()
                    if let correctData = data {
                        do {
                            let results = try jsonDecoder.decode(DigiTrafficData.self, from: correctData)
                            DispatchQueue.main.async {
                                self.digiTrafficData = results.features
                                
                                for i in results.features {
                                    self.province.insert(i.properties.province)
                                }
                                self.provinceArray = Array(self.province)
                                self.provinceArray.sort()
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            getData.resume()
        }
    }
    
    func getCameraData() {
        if let cameraDataUrl = URL(string: "https://tie.digitraffic.fi/api/v1/data/camera-data") {
            let urlSession = URLSession(configuration: .default)
            let getData = urlSession.dataTask(with: cameraDataUrl) { (data, response, error) in
                if error == nil {
                    let jsonDecoder = JSONDecoder()
                    if let correctData = data {
                        do {
                            let results = try jsonDecoder.decode(CameraData.self, from: correctData)
                            DispatchQueue.main.async {
                                self.cameraStations = results.cameraStations
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            getData.resume()
        }
    }
    
    func getImage(roadId: String) {
        DispatchQueue.main.async {
            self.imageUrl.removeAll()
            for road in self.cameraStations {
                if road.id == roadId {
                    self.imageUrl.append(road.cameraPresets[0].presentationName ?? "404 road not found.")
                }
            }
        }
    }
    
    func getPreset(roadId: String) {
        DispatchQueue.main.async {
            self.roads.removeAll()
            for road in self.digiTrafficData {
                if road.properties.names.fi == roadId {
                    for preset in road.properties.presets {
                        self.roads.append(preset)
                    }
                }
            }
        }
    }
    
    func getRoad(certainMunicipality: String) {
        DispatchQueue.main.async {
            self.road.removeAll()
            for municipality in self.digiTrafficData {
                if municipality.properties.municipality == certainMunicipality {
                    self.road.append(municipality.properties.names.fi ?? "Municipality")
                }
            }
        }
    }
    
    func getMunicipality(certainProvince: String) {
        DispatchQueue.main.async {
            self.municipality.removeAll()
            for province in self.digiTrafficData {
                if province.properties.province == certainProvince {
                    self.municipality.insert(province.properties.municipality)
                }
            }
            self.municipalityArray = Array(self.municipality)
            self.municipalityArray.sort()
        }
    }
}
