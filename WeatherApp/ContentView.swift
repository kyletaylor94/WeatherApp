//
//  ContentView.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WelcomeView().environmentObject(UserLocation())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
