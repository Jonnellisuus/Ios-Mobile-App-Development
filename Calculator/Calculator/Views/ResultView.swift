//
//  ResultView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var calculatorVM: CalculatorVM
    var body: some View{
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text(calculatorVM.result)
                    .foregroundColor(Color.white)
                    .font(.system(size: CGFloat(calculatorVM.fontSize)))
                    .padding(.trailing, 30)
            }
        }
    }
}
