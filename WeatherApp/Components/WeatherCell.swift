//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import SwiftUI

struct WeatherCell: View {
    
    var text: String
    var imageName: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading,spacing: 25){
           
            HStack{
                Image(systemName: imageName)
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                    .cornerRadius(50)
                
                VStack{
                    Text(text)
                        .font(.caption)
                    Text(value)
                        .font(.system(size: 30, weight: .heavy))
                }
        Spacer()
                
            }
        }
        .foregroundColor(Color("background"))
        .padding(.horizontal)
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell(text: "Min temp", imageName: "temperature", value: "1m/s")
    }
}
