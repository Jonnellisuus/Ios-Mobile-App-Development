//
//  CameraView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 27.3.2021.
//

import SwiftUI

struct CameraView: View {
    let imageUrl: URL
    var body: some View {
        PlaceholderImage(url: imageUrl, placeholder: Text("Loading")).aspectRatio(contentMode: .fit)
        Spacer()
    }
}
