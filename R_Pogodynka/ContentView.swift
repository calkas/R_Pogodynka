//
//  ContentView.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RWeatherViewModel().tabItem {
                Image(systemName: "sun.max.fill")
                Text("Main")
            }
                
            RWeatherDetailedViewModel().tabItem {
                Image(systemName: "thermometer.sun.fill")
                Text("Detailed")
            }
            
            RWeatherSettingsViewModel().tabItem {
                Image(systemName: "gearshape")
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
