//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: UserLocation
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("background").ignoresSafeArea()
                VStack(alignment: .center, spacing: 20){
                    Text("Welcome to the Weather App")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text("Please share your current location to get the weather in your area")
                        .foregroundColor(.white)
                        .padding()
                    
                    NavigationLink {
                        //share current location
                        MainView(viewModel: WeatherManager(viewModel: viewModel, lan: viewModel.location?.latitude ?? 0.0, lon: viewModel.location?.longitude ?? 0.0))
                    } label: {
                        HStack{
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                            
                            Text("Share Current Location")
                                .foregroundColor(.white)
                        }
                        .frame(width: 250, height: 40)
                        .background(Capsule())
                    }
                    .onTapGesture {
                        viewModel.requestLocation()
                    }
                    if viewModel.isLoading{
                        ProgressView()
                    } else {
                        if let location = viewModel.location{
                            Text("\(location.latitude)")
                                .foregroundColor(.white)
                            
                            Text("\(location.longitude)")
                                .foregroundColor(.white)
                        }
                    }
                }
                .multilineTextAlignment(.center)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(UserLocation())
    }
}
