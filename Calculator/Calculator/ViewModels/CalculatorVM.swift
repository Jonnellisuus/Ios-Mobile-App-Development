//
//  CalculatorVM.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

class CalculatorVM: ObservableObject {
    @Published var result: String = "0"
    @Published var fontSize = 90
    
    func getFontSize(numberLength: Int) {
        switch numberLength {
        case 7:
            self.fontSize = 80
        case 8:
            self.fontSize = 70
        case 9:
            self.fontSize = 60
        default:
            break
        }
    }
    
    func handleKeyPress(key: Key) {
        if (self.result.count == 0 || self.result.count < 9) {
            self.result = result == "0" ? key.label : result + key.label
            self.getFontSize(numberLength: self.result.count)
        }
    }
    
    func getKeys() -> [[Key]] {
        return [
            [
                Key(label: "AC", color: Color.gray, labelColor: Color.black),
                Key(label: "+/-", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
                Key(label: "%", color: Color.gray, labelColor: Color.black, type: KeyType.Operator),
                Key(label: "/", color: Color.orange, labelColor: Color.white, type: KeyType.Operator),
            ],
            [
                Key(label: "7"),
                Key(label: "8"),
                Key(label: "9"),
                Key(label: "*", color: Color.orange, labelColor: Color.white, type: KeyType.Operator),
            ],
            [
                Key(label: "4"),
                Key(label: "5"),
                Key(label: "6"),
                Key(label: "-", color: Color.orange, labelColor: Color.white, type: KeyType.Operator),
            ],
            [
                Key(label: "1"),
                Key(label: "2"),
                Key(label: "3"),
                Key(label: "+", color: Color.orange, labelColor: Color.white, type: KeyType.Operator),
            ],
            [
                Key(label: "0"),
                Key(label: ","),
                Key(label: "=", color: Color.orange, labelColor: Color.white, type: KeyType.Operator),
            ],
        ]
    }
}
