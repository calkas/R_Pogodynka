//
//  RWeatherSettingsViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherSettingsViewModel: View {
    @State private var location: String = ""
    var body: some View {
        VStack {
            Text("RWeatherSettingsViewModel")
            TextField("Enter your location...", text: $location).textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
    }
}

struct RWeatherSettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherSettingsViewModel()
    }
}
