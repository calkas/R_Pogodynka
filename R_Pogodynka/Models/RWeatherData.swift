//
//  RWeatherData.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 08/01/2021.
// ---------  JSON Weather API ---------
// http://api.weatherstack.com/current?access_key=9a71c6a9950ded3d89c11b3c3091de2f&query=Katowice

import Foundation
struct RWeatherSimpleData{
    init(city: String)
    {
        self.city = city
    }
    var city = ""
    var weatherDescription = "--"
    var icon = ""
    var temperature = ""
}

struct RWeatherDetailedData {
    init(city: String)
    {
        self.city = city
    }
    var city = ""
    var weatherDescription = "--"
    var temperature = ""
    var windSpeed = ""
    var windDir = ""
    var pressure = ""
    var humidity = ""
    var cloudcover = ""
    var uv_index = ""
}

class RWeatherData : ObservableObject, RWeatherDataGetting {

    @Published var weatherSimpleData = RWeatherSimpleData(city: "Katowice")
    @Published var weatherDeatiledData = RWeatherDetailedData(city: "Katowice")
    @Published var isNight = false
    private let urlWeatherAddress: String = "http://api.weatherstack.com/current?access_key=9a71c6a9950ded3d89c11b3c3091de2f&query=Katowice"
    
    func startWeatherDataProcessing() {
        if let url = URL(string: urlWeatherAddress)
        {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    return
                }
                if response != nil {
                    
                }
                
                if let respRawData = data {
                    let q = DispatchQueue(label: "QueueWeatherData")
                    q.async {
                        DispatchQueue.main.async {
                            let decodedData = try? JSONDecoder().decode(Weather.self, from: respRawData)
                            if let rawData = decodedData {
                                if let isDayStr = rawData.current?.is_day {
                                    if isDayStr == "yes" {
                                        self.isNight = false
                                    }
                                    else {
                                        self.isNight = true
                                    }
                                }
                                
                                self.saveSimpleWeatherData(data: rawData)
                                self.saveDetailedWeatherData(data: rawData)
                            }
                        }
                    }
                }
                
            }.resume()
        }
    }
    
    private func getWeatherIcon (weatherDesc : String) -> String {
        switch weatherDesc {
            case "Clear": return "moon.stars.fill"
            case "Sunny": return "sun.max.fill"
            case "Partly cloudy Moon": return "cloud.moon.fill"
            case "Partly cloudy": return "cloud.sun.fill"
            case "Cloudy": return "cloud.fill"
            case "Overcast": return "smoke.fill"
            case "Mist": return "cloud.fog.fill"
            case "Patchy rain possible": return "cloud.drizzle.fill"
            case "Patchy snow possible": return "cloud.hail.fill"
            case "Patchy sleet possible": return "cloud.sleet.fill"
            case "Patchy freezing drizzle possible": return "cloud.hail.fill"
            case "Thundery outbreaks possible": return "cloud.bolt.rain.fill"
            case "Blowing snow": return "cloud.snow.fill"
            case "Blizzard": return "wind.snow"
            case "Fog": return "cloud.fog.fill"
            case "Freezing fog": return "cloud.fog"
            case "Patchy light drizzle": return "cloud.drizzle.fill"
            case "Light rain": return "cloud.rain.fill"
            case "Moderate rain at times": return "cloud.rain.fill"
            case "Heavy rain": return "cloud.heavyrain.fill"
            case "Light freezing rain": return "cloud.hail.fill"
            case "Heavy rain at times": return "cloud.heavyrain.fill"
            default: return "sun.max.fill"
        }

    }
    
    private func saveSimpleWeatherData(data: Weather) {
        
        if let weatherDescription = data.current?.weather_descriptions[0], let temperature = data.current?.temperature {
            weatherSimpleData.weatherDescription = weatherDescription
            weatherSimpleData.icon = self.getWeatherIcon(weatherDesc: weatherDescription)
            weatherSimpleData.temperature = "\(temperature) °C"
        }
        
    }
    
    
    private func saveDetailedWeatherData(data: Weather) {
        if let weatherDescription = data.current?.weather_descriptions[0], let temperature = data.current?.temperature, let windSpeed = data.current?.wind_speed, let windDir = data.current?.wind_dir, let pressure = data.current?.pressure, let humidity = data.current?.humidity, let cloudcover = data.current?.cloudcover, let uv_index = data.current?.uv_index {
            
            weatherDeatiledData.weatherDescription = weatherDescription
            weatherDeatiledData.temperature = "\(temperature) °C"
            weatherDeatiledData.windSpeed = "\(windSpeed) km/h"
            weatherDeatiledData.windDir = windDir
            weatherDeatiledData.pressure = "\(pressure) hPa"
            weatherDeatiledData.humidity = "\(humidity) %"
            weatherDeatiledData.cloudcover = "\(cloudcover) %"
            weatherDeatiledData.uv_index = "\(uv_index)"
        }
        
    }
}

