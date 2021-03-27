//
//  ImageLoad.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import Foundation
import SwiftUI
import Combine

class ImageLoad: ObservableObject {
    @Published var image: UIImage?
    private var url: URL
    private var anyCancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    func loadImage() {
        anyCancellable = URLSession.shared.dataTaskPublisher(for: url).map { UIImage(data: $0.data) }
            .replaceError(with: nil).receive(on: DispatchQueue.main).assign(to: \.image, on: self)
    }
}
