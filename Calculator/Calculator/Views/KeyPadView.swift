//
//  KeyPadView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

struct KeyPadView:View {
    @Binding var value: String
    
    var body: some View{
        VStack(spacing: 15) {
            ForEach(0 ..< keys.count) { index in
                HStack(spacing: 10) {
                    ForEach(0 ..< keys[index].count) { innerIndex in
                        KeyView(key: keys[index][innerIndex], value: self.$value)
                    }
                }
            }
        }
    }
}
