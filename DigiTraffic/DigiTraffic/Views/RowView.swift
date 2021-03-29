//
//  RowView.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 29.3.2021.
//

import SwiftUI

struct RowView: View {
    var preset: CameraPreset
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("dome").resizable().frame(width: 30, height: 30)
                Text(preset.presentationName ?? "presentation name not found")
            }
            Divider()
        }
    }
}

