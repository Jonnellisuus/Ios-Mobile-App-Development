//
//  ContentView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

var keys: [[Key]] = [
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

struct ContentView: View {
    @State var value = "0"
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ResultView(value: value )
                KeyPadView(value: $value)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
