//
//  RWeatherBackgroundView.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 10/01/2021.
//

import SwiftUI

struct RWeatherBackgroundView: View {
    
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? . gray : Color("LightBlueWeatherColor")]), startPoint:/*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/, endPoint:/*@START_MENU_TOKEN@*/.bottomTrailing/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
