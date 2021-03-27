//
//  PlaceholderImage.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import SwiftUI

struct PlaceholderImage<Placeholder: View>: View {
    @ObservedObject private var loadTafficImage: ImageLoad
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loadTafficImage = ImageLoad(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image.onAppear(perform: loadTafficImage.loadImage)
    }
    
    private var image: some View {
        Group {
            if loadTafficImage.image != nil {
                Image(uiImage: loadTafficImage.image!).resizable()
            } else {
                placeholder
            }
        }
    }
}
