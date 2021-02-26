//
//  RWeatherSettings.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 11/01/2021.
//

import Foundation

class Settings : ObservableObject {
    
    init(location: String) {
        self.location = location
    }
    @Published var location: String
}
