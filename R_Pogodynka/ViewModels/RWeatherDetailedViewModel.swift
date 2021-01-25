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
    
    fileprivate func DetailedWeatherDescView() -> some View {
        let outputStr = "Temperature: " + weatherData.weatherDataResponse.temperature + "\n" +
        "Humidity: " + weatherData.weatherDataResponse.humidity + "\n" +
        "Pressure: " + weatherData.weatherDataResponse.pressure + "\n" +
        "Wind: " + weatherData.weatherDataResponse.windDir + " " + weatherData.weatherDataResponse.windSpeed + "\n" +
        "Cloud cover: " + weatherData.weatherDataResponse.cloudcover + "\n" +
        "UV index: " + weatherData.weatherDataResponse.uv_index
        
        return Text(outputStr)
            .font(.body)
            .foregroundColor(.white)
    }
    
    fileprivate func tableFormatView(text:String, value: String) -> some View {
        
        return VStack {
            HStack {
                    Text(text)
                        .font(.body)
                        .foregroundColor(.white)
                    Spacer()
                    Text(value)
                        .font(.body)
                        .foregroundColor(.white)
                
            }
            Divider().foregroundColor(.white)
            Spacer()
        }
    }
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weatherData.isNight)

            VStack {
                Text(weatherData.weatherDataResponse.city)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                HStack {
                    if(weatherData.isFetchingDone)
                    {
                        Text(weatherData.weatherDataResponse.localTime)
                            .foregroundColor(.white)
                            .italic()
                    }
                    else
                    {
                        Text("Fetching...")
                            .foregroundColor(.white)
                            .italic()
                    }
                    Button(action: {self.weatherData.startWeatherDataProcessing(location: settings.location)}, label: {
                        Image(systemName: "arrow.2.circlepath")
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(weatherData.isFetchingDone ? 360:0))
                            .animation(.linear)
                            .onAppear() {}
                    })
                }

                Text(weatherData.weatherDataResponse.weatherDescription)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                
                tableFormatView(text: "Temperature", value: weatherData.weatherDataResponse.temperature)
                tableFormatView(text: "Humidity", value: weatherData.weatherDataResponse.humidity)
                tableFormatView(text: "Pressure", value: weatherData.weatherDataResponse.pressure)
                tableFormatView(text: "Wind", value: weatherData.weatherDataResponse.windDir + " " + weatherData.weatherDataResponse.windSpeed)
                tableFormatView(text: "Cloud cover", value: weatherData.weatherDataResponse.cloudcover)
                tableFormatView(text: "UV index", value: weatherData.weatherDataResponse.uv_index)
                Spacer()
            }
        }
        .onAppear(){
            self.weatherData.startWeatherDataProcessing(location: settings.location)
        }

    }
}

struct RWeatherDetailedViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherDetailedViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
