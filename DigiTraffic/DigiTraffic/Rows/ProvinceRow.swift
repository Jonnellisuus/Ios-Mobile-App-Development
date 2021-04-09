//
//  ProvinceRow.swift
//  DigiTraffic
//
//  Created by Jonne Kiukas on 9.4.2021.
//

import Foundation
import Combine
import SwiftUI

struct ProvinceRow: View {
    var digiTraffic: DigiTraffic

    var body: some View {
        HStack {
            if digiTraffic.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
