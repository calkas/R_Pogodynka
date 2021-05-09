//
//  RWeatherDetailedViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherDetailedViewModel: View {
    @EnvironmentObject var settings: Settings
    @StateObject var weatherData = RWeatherData()
    
    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: $weatherData.isNight)
            
            ScrollView {
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
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                
                weatherDataTableView()
                weatherIndicatorsView()
                Spacer()
                
            }.onAppear() { self.weatherData.startWeatherDataProcessing(location: settings.location) }
        }
    }
    
    fileprivate func weatherDataTableView() -> some View {
        return VStack {
            tableFormatView(text: "Temperature", value: "\(weatherData.weatherDataResponse.temperature) °C")
            tableFormatView(text: "Pressure", value: "\(weatherData.weatherDataResponse.pressure) hPa")
        }
    }
    
    fileprivate func weatherIndicatorsView() -> some View {
        return VStack {
            HStack {
                CircleProgressBarView(progressBarName: "Humidity", value: weatherData.weatherDataResponse.humidity, maxValue: 100, specialSign: "%")
                    .padding()
                WindProgressBarView()
            }
            HStack {
                CircleProgressBarView(progressBarName: "Cloud cover", value: weatherData.weatherDataResponse.cloudcover, maxValue: 100, specialSign: "%")
                    .padding()
                CircleProgressBarView(progressBarName: "UV", value: weatherData.weatherDataResponse.uv_index, maxValue: 10)
            }
        }
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
    
    fileprivate func CircleProgressBarView(progressBarName: String, value: Int, maxValue: Int, specialSign: String = "") -> some View {
        
        let convValue    = CGFloat(value)
        let convMaxValue = CGFloat(maxValue)
        return
            VStack {
                Text(progressBarName)
                    .foregroundColor(.white)
                    .font(.body)
                ZStack {
                    Circle()
                        .stroke(Color.white, lineWidth: 10.0)
                        .opacity(0.3)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Circle()
                        .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: min(CGFloat(convValue / convMaxValue), 1.0))
                        .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                        .rotationEffect(Angle(degrees: 270.0))
                        .foregroundColor(weatherData.isNight ? Color.pink : Color.blue)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("\(value)" + specialSign)
                        .font(.body)
                        .foregroundColor(.white)
                }
            }
    }
    
    fileprivate func WindProgressBarView() -> some View {
        let dic: [String: CGFloat] = ["N": 0.0, "NE": 0.114, "E": 0.24, "SE": 0.374, "S": 0.49, "SW": 0.624, "W": 0.74, "NW": 0.874]
        
        var dicIndex: String = ""
        
        if(weatherData.weatherDataResponse.windDir.count > 2)
        {
            let substring = weatherData.weatherDataResponse.windDir.dropFirst()
            dicIndex = String(substring)
        }
        else
        {
            dicIndex = weatherData.weatherDataResponse.windDir
        }
        
        let windDirValue = dic[dicIndex] ?? 0.0
        let offset: CGFloat = 0.01
        
        return VStack {
            Text("Wind - " + weatherData.weatherDataResponse.windDir)
                .foregroundColor(.white)
                .font(.body)
            ZStack {
                Circle()
                    .stroke(Color.white, lineWidth: 10.0)
                    .opacity(0.3)
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Circle()
                    .trim(from: windDirValue, to: windDirValue + offset)
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(weatherData.isNight ? Color.pink : Color.blue)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("\(weatherData.weatherDataResponse.windSpeed) km/h")
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
}

struct RWeatherDetailedViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherDetailedViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
