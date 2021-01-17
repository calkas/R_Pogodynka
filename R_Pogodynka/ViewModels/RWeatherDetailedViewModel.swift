//
//  RWeatherDetailedViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherDetailedViewModel: View {
    @EnvironmentObject var settings: Settings
    @ObservedObject var weather: RWeatherData = RWeatherData()
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weather.isNight)
            
            VStack {
                Text(weather.weatherDeatiledData.city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Text(weather.weatherDeatiledData.weatherDescription)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
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
                Button(action: { self.weather.startWeatherDataProcessing(location: settings.location)}, label: {
                    WeatherButton(title: "Get Weather", textColor: weather.isNight ? .black : .blue, backgroundColor: .white)
                }).offset(y: -100)
            }
            
            
        }
        /*
        .onAppear(){
            self.weather.startWeatherDataProcessing(location: settings.location)
        }
        */
    }
}

struct RWeatherDetailedViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherDetailedViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
