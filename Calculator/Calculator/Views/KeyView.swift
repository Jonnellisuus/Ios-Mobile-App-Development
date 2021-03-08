//
//  KeyView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

struct KeyView:View {
    var key: Key
    @Binding var value: String
    
    var body: some View {
        let width = key.label == "0" ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width / 4
        let height = UIScreen.main.bounds.width / 4
        
        return Button(action: {
            self.value = self.value == "0" ? self.key.label : self.value + self.key.label
        }){
            RoundedRectangle(cornerRadius: 200)
            .foregroundColor(key.color)
            .frame(width: width - 10, height: height - 10, alignment: .center)
            .overlay(
                Text(key.label)
                    .foregroundColor(key.labelColor)
                    .font(.system(size: 40))
                    .padding(.trailing, self.key.label == "0" ? width - 100 : 0)
            )
        }
    }
}
