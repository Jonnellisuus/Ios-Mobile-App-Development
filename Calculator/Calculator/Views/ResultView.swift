//
//  ResultView.swift
//  Calculator
//
//  Created by Jonne Kiukas on 8.3.2021.
//

import SwiftUI

struct ResultView: View {
    var value: String
    var body: some View{
        VStack{
            Spacer()
            HStack {
                Spacer()
                Text(self.value)
                    .foregroundColor(Color.white)
                    .font(.system(size: 90))
                    .padding(.trailing, 30)
            }
        }
    }
}
