//
//  ContentView.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    var settings = Settings(location: "Katowice")
    var body: some View {
        TabView {
            RWeatherViewModel().environmentObject(settings).tabItem {
                Image(systemName: "sun.max.fill")
                Text("Main")
            }
                
            RWeatherDetailedViewModel().environmentObject(settings).tabItem {
                Image(systemName: "thermometer.sun.fill")
                Text("Detailed")
            }
            
            RWeatherSettingsViewModel().environmentObject(settings).tabItem {
                Image(systemName: "gearshape")
                    .padding()
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
