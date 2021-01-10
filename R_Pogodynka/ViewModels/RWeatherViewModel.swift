//
//  RWeatherViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherViewModel: View {
    @ObservedObject var weather: RWeatherData = RWeatherData()
    
 
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weather.isNight)
            
            VStack(spacing: 10) {
                Text(weather.weatherSimpleData.city)
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.white)
                Text(weather.weatherSimpleData.weatherDescription)
                    .padding()
                    .foregroundColor(.white)

                Image(systemName:weather.weatherSimpleData.icon)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(weather.weatherSimpleData.temperature)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }.onAppear(){
            self.weather.startWeatherDataProcessing()
        }

    }
}

struct RWeatherViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherViewModel()
    }
}
