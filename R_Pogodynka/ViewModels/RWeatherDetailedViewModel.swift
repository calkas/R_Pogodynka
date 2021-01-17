//
//  RWeatherDetailedViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherDetailedViewModel: View {
    @EnvironmentObject var settings: Settings
    @ObservedObject var weatherData: RWeatherData = RWeatherData()
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weatherData.isNight)
            
            VStack {
                Text(weatherData.weatherDataResponse.city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Text(weatherData.weatherDataResponse.weatherDescription)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Text("Temperature: " + weatherData.weatherDataResponse.temperature)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Humidity: " + weatherData.weatherDataResponse.humidity)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Pressure: " + weatherData.weatherDataResponse.pressure)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Wind: " + weatherData.weatherDataResponse.windDir + " " + weatherData.weatherDataResponse.windSpeed)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Cloud cover: " + weatherData.weatherDataResponse.cloudcover)
                    .font(.body)
                    .foregroundColor(.white)
                Text("UV index: " + weatherData.weatherDataResponse.uv_index)
                    .font(.body)
                    .foregroundColor(.white)
                
                Spacer()
                Button(action: { self.weatherData.startWeatherDataProcessing(location: settings.location)}, label: {
                    WeatherButton(title: "Get Weather", textColor: weatherData.isNight ? .black : .blue, backgroundColor: .white)
                }).offset(y: -90.0)
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
