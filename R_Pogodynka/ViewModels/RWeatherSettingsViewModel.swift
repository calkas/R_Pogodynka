//
//  RWeatherSettingsViewModel.swift
//  R_Pogodynka
//
//  Created by Piotr Rybka on 07/01/2021.
//

import SwiftUI

struct RWeatherSettingsViewModel: View {
    @State private var inputLocation = ""
    @EnvironmentObject var settings: Settings

    var body: some View {
        ZStack {
            RWeatherBackgroundView(isNight: .constant(false))
            ScrollView {
                TitleView(titleName: "Settings")
                    .padding()
                                
                CurrentLocationGroupView(location: settings.location)
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                LocationGroupView()
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                AboutAppGroupView()
                    .frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                Spacer()
            }
        }
    }
    
    fileprivate func TitleView(titleName: String) -> some View {
        return
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Text(titleName)
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                Image(systemName:"gearshape").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundColor(.white)
            }
    }
    
    fileprivate func CurrentLocationGroupView(location: String) -> some View {
        return GroupBox(label: Text("Current location: " + location), content: {
        })
    }
    
    
    fileprivate func LocationGroupView() -> some View {
        return GroupBox(label: Text("Set new location"), content: {
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
    }
    
    fileprivate func AboutAppGroupView() -> some View {
        return GroupBox(label: Text("About"), content: {
            HStack {
                Text("Version")
                    .padding()
                Spacer()
                Text("1.0")
            }
            Link("GitHub Repo", destination: URL(string: "https://github.com/calkas/R_Pogodynka")!)
        })
    }
    
}
struct RWeatherSettingsViewModel_Previews: PreviewProvider {
    static var previews: some View {
        RWeatherSettingsViewModel().environmentObject(Settings(location: "Katowice"))
    }
}
