//
//  RWeatherViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherViewModel: View {
    
    @EnvironmentObject var settings: Settings
    @ObservedObject var weatherData: RWeatherData = RWeatherData()
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weatherData.isNight)
            
            VStack(spacing: 10) {
                Text(weatherData.weatherDataResponse.city)
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Text(weatherData.weatherDataResponse.localTime)
                    .foregroundColor(.white)
                    .italic()
                Text(weatherData.weatherDataResponse.weatherDescription)
                    .padding()
                    .font(.body)
                    .foregroundColor(.white)

                Image(systemName:weatherData.weatherDataResponse.icon)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(weatherData.weatherDataResponse.temperature)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .onAppear(){
            self.weatherData.startWeatherDataProcessing(location: settings.location)
        }


    }
}

struct RWeatherViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
