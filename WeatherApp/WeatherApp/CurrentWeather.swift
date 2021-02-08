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
            Text("Current Temperature in")
                .foregroundColor(.black)
                .font(.system(size: 40))
                .padding(.horizontal)
            
            Text("\(specificWeather?.name ?? "?")")
                .foregroundColor(.black)
                .font(.system(size: 50))
            
            Text("Lat: \(specificWeather?.coord.lat ?? 0)")
                .foregroundColor(.black)
                .font(.system(size: 45))
            
            Text("Lon: \(specificWeather?.coord.lon ?? 0)")
                .foregroundColor(.black)
                .font(.system(size: 45))
             
            Text("\(specificWeather?.weather[0].main ?? "?")")
                .foregroundColor(.black)
                .font(.system(size: 50))
            
            Text("\(specificWeather?.weather[0].description ?? "?")")
                .foregroundColor(.black)
                .font(.system(size: 50))
            
            Text("\(specificWeather?.main.temp ?? 0, specifier: "%.2f")°C")
                .foregroundColor(.black)
                .font(.system(size: 80))
                
            Text("Humidity: \(specificWeather?.main.humidity ?? 0)%")
                .foregroundColor(.black)
                .font(.system(size: 50))
                
            Text("Pressure: \(specificWeather?.main.humidity ?? 0) hPa")
                .foregroundColor(.black)
                .font(.system(size: 50))
                .padding(.bottom, 200.0)
            
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
