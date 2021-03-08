//
//  Key.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import Foundation
import SwiftUI

enum KeyType {
    case Number
    case Operator
}

struct Key: Identifiable {
    var id: UUID = UUID()
    var label: String
    var color: Color = Color.secondary
    var labelColor: Color = Color.white
    var type: KeyType = KeyType.Number
}
