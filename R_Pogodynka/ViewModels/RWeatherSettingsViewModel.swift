//
//  RWeatherSettingsViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherSettingsViewModel: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .gray,Color("LightBlueWeatherColor")]), startPoint: /*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.bottomTrailing/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Enter your location: ")
                    .font(.title2)
                    .foregroundColor(.white)
                TextField("Enter your location...", text:   $settings.location).textFieldStyle(RoundedBorderTextFieldStyle())
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
    }
        
}

struct RWeatherSettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherSettingsViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
