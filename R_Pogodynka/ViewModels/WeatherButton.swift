//
//  WeatherButton.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 17/01/2021.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text("\(title)")
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(backgroundColor)
            .font(.title2)
            .foregroundColor(textColor)
            .cornerRadius(10)
    }
}
