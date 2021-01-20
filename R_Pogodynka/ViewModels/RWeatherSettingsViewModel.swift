//
//  RWeatherSettingsViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherSettingsViewModel: View {
    @State var inputLocation = ""
    @EnvironmentObject var settings: Settings
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .gray,Color("LightBlueWeatherColor")]), startPoint: .topLeading, endPoint:.bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Enter your location: ")
                    .font(.title2)
                    .foregroundColor(.white)
                
                TextField("Enter your location...", text: $inputLocation, onCommit: { self.settings.location = self.inputLocation})
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
                    .border(Color(UIColor.separator))
            }
        }
    }
        
}

struct RWeatherSettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherSettingsViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
