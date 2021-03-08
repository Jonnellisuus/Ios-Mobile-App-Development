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

struct ResultView: View {
    var body: some View{
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text("0")
                    .foregroundColor(Color.white)
                    .font(.system(size: 90))
                    .padding(.trailing, 30)
            }
        }
    }
}

struct KeyView:View {
    var key: Key
    var body: some View {
        let width = key.label == "0" ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width / 4
        let height = UIScreen.main.bounds.width / 4
        
        return Button(action: {
            print(self.key.label)
        }){
            RoundedRectangle(cornerRadius: 200)
            .foregroundColor(key.color)
            .frame(width: width - 10, height: height - 10, alignment: .center)
            .overlay(
                Text(key.label)
                    .foregroundColor(key.labelColor)
                    .font(.system(size: 40))
            )
        }
    }
}

struct KeyPadView:View {
    var body: some View{
        VStack(spacing: 15) {
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

struct ContentView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack{
                ResultView()
                KeyPadView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
