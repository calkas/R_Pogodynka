//
//  RWeatherDataGetting.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 08/01/2021.
//

import Foundation


protocol RWeatherDataGetting {
    func startWeatherDataProcessing(location: String) -> Void
}
