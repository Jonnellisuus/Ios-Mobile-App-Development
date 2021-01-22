//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Jonne Kiukas on 20.1.2021.
//
// Note. When running this application on simulator use Iphone 12 Pro Max.
// The responsiveness is the best on Iphone 12 Pro Max.
//

import Foundation
import SwiftUI

struct CurrentWeather: View {
    var specificWeather: WeatherData?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Enter a city above to get temperature")
                .foregroundColor(.black)
                .font(.system(size: 50))
                .padding(.horizontal)
            Spacer()
            
            Text("\(specificWeather?.main.temp.round ?? 0) °C")
                .foregroundColor(.black)
                .font(.system(size: 80))
            
            Text("\(specificWeather?.weather.description ?? "Unknown")")
                .foregroundColor(.black)
                .font(.system(size: 50))
           
            Text("\(specificWeather?.name ?? "Unknown")")
                .foregroundColor(.black)
                .font(.system(size: 50))
                .padding(.bottom, 500.0)
            Spacer()
    }
        .background(
        Image("WheaterAppBackground")
            .resizable()
            .scaledToFill()
            .clipped())
            .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
