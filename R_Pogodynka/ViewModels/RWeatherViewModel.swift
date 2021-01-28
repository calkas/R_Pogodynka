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
    
                    Button(action: {self.weatherData.startWeatherDataProcessing(location: settings.location)
                    }, label: {
                        Image(systemName: "arrow.2.circlepath")
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(weatherData.isFetchingDone ? 360:0))
                            .animation(.linear)
                            .onAppear() {
                                
                            }
                    })
                }
                Text(weatherData.weatherDataResponse.weatherDescription)
                    .padding()
                    .font(.body)
                    .foregroundColor(.white)
                    
                Image(systemName:weatherData.weatherDataResponse.icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                Text(weatherData.weatherDataResponse.temperature + " °C")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .onAppear(){
            //self.weatherData.startWeatherDataProcessing(location: settings.location)
            self.weatherData.getFakeWeatherData(isNight: false)
        }


    }
}

struct RWeatherViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
