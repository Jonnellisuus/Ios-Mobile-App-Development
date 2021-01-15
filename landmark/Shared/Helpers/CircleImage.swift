//
//  CircleImage.swift
//  landmark (iOS)
//
//  Created by Jonne Kiukas on 11.1.2021.
//

import Foundation
import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .contextMenu {
            Button(action: {
            }) {
            Text("Delete")
            Image(systemName: "trash")
            }
            Button(action: {
            }) {
            Text("ADD")
            Image(systemName: "plus")
                   }
                }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
