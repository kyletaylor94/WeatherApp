//
//  MainView.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import SwiftUI
import Kingfisher

struct MainView: View {
    
    @StateObject var viewModel: WeatherManager
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading, spacing: 5){
                Text("")
                    .font(.system(size: 35))
                    .bold()
                    .padding(.leading)

                
                Text("Today, Dec1, 3:44PM")
                    .padding(.leading)
                
                HStack{
                    Image(systemName: "cloud")
                        .font(.system(size: 50))
                    Spacer()
                    Text("9°")
                        .font(.system(size: 80,weight: .heavy))
                    
                }
                .padding(.horizontal)
                Text("Clear")
                    .padding(.horizontal, 28)
                    .padding(.bottom)
                
                Spacer()
                
                KFImage(URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"))
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Weather now")
                        
                    
                    HStack{
                        WeatherCell(text: "Temp Min", imageName: "thermometer.low", value: "-3°")
                        
                        WeatherCell(text: "Temp Max", imageName: "thermometer.high", value: "-4°")
                    }
                    
                    HStack{
                        WeatherCell(text: "Wind speed", imageName: "wind", value: "2m/s")
                        
                        WeatherCell(text: "Humidity", imageName: "humidity", value: "46%")
                    }
                   
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: WeatherManager(viewModel: UserLocation(), lan: UserLocation().location?.latitude ?? 0.0, lon: UserLocation().location?.longitude ?? 0.0))
            .environmentObject(UserLocation())
    }
}
