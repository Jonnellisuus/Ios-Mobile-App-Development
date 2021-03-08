//
//  ContentView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

// var keys: [[Key]] = 

struct ContentView: View {
    var calculatorVM: CalculatorVM = CalculatorVM()
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ResultView()
                KeyPadView()
            }
        }.environmentObject(calculatorVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
