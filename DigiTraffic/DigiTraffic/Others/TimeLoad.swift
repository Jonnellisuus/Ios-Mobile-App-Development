//
//  TimeLoad.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 29.3.2021.
//

import Foundation
import SwiftUI
import Combine

class TimeLoad: ObservableObject {
    @Published var time: Date
    private var measeuredTime: Date
    private var anyCancellable: AnyCancellable?
    
    init(measeuredTime: Date) {
        self.measeuredTime = measeuredTime
    }
    
    func loadTime() {
        anyCancellable = URLSession.shared.dataTaskPublisher(for: measeuredTime).map }
            .replaceError(with: nil).receive(on: DispatchQueue.main).assign(to: \.time, on: self)
    }
}
