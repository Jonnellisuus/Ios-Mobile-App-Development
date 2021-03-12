//
//  KeyPadView.swift
//  CalculatorTask
//
//  Created by Jonne Kiukas on 12.3.2021.
//

import SwiftUI

struct KeyPadView:View {
    @EnvironmentObject var calculatorVM: CalculatorVM
    
    var body: some View{
        let keys:[[Key]] = calculatorVM.getKeys()
        
        return VStack(spacing: 15) {
            ForEach(0 ..< keys.count) { index in
                HStack(spacing: 10) {
                    ForEach(0 ..< keys[index].count) { innerIndex in
                        KeyView(key: keys[index][innerIndex])
                    }
                }
            }
        }
    }
}
