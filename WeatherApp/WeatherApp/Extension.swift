//
//  Extension.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 20.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import Foundation

extension Int {
    var timestamp: TimeInterval {
        return TimeInterval(self)
    }
    
    var toString: String {
        return String(self)
    }
}
