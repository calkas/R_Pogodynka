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
            LinearGradient(gradient: Gradient(colors: [.blue, Color("LightBlueWeatherColor")]), startPoint: /*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.bottomTrailing/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            VStack {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Text("Settings")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    Image(systemName:"gearshape").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                        .foregroundColor(.white)
                }.padding()

                GroupBox(label: Text("Current location:  \(settings.location)"), content: {
                }).frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                GroupBox(label: Text("Set new location"), content: {
                    HStack {
                        Image(systemName:"1.magnifyingglass").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
          
                        Spacer()
                        TextField("Enter your location...", text: $inputLocation, onCommit: { self.settings.location = self.inputLocation})
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                    }

                })
                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
 
        
                GroupBox(label: Text("About"), content: {

                    HStack {
                        Text("Version")
                            .padding()
                        Spacer()
                        Text("1.0")
                    }
                    Link("GitHub Repo", destination: URL(string: "https://github.com/calkas/R_Pogodynka")!)
                })
                .frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                Spacer()
            }
        }
    }
        
}

struct RWeatherSettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherSettingsViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
