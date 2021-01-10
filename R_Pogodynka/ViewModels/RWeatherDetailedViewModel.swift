//
//  RWeatherDetailedViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherDetailedViewModel: View {
    @ObservedObject var weather: RWeatherData = RWeatherData()
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weather.isNight)
            VStack {
                Text(weather.weatherDeatiledData.city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                Text(weather.weatherDeatiledData.weatherDescription)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Divider().background(Color.white)
                Text("Temperature: " + weather.weatherDeatiledData.temperature)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Humidity: " + weather.weatherDeatiledData.humidity)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Pressure: " + weather.weatherDeatiledData.pressure)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Wind: " + weather.weatherDeatiledData.windDir + " " + weather.weatherDeatiledData.windSpeed)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Cloud cover: " + weather.weatherDeatiledData.cloudcover)
                    .font(.body)
                    .foregroundColor(.white)
                Text("UV index: " + weather.weatherDeatiledData.uv_index)
                    .font(.body)
                    .foregroundColor(.white)
                Spacer()
            }
            
            
        }.onAppear(){
            self.weather.startWeatherDataProcessing()
        }
    }
}

struct RWeatherDetailedViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherDetailedViewModel()
    }
}
