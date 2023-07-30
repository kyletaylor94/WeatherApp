//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import Foundation

class WeatherManager: ObservableObject{
    @Published var weatherAll = [Weather]()
    @Published var city = [Weather]()
    
    
    
    var lan: Double
    var lon: Double
    
    let today = Date()
    let apikey = "2ba2eb3ed4a3ce8f14fa11815e0149ff"
    
   // let endpoint = URL(string: "api.openweathermap.org/data/2.5/forecast?id=524901&appid=2ba2eb3ed4a3ce8f14fa11815e0149ff&lon=32.0&lan=32.0")
   

    
    init(viewModel: UserLocation, lan: Double, lon: Double){
        self.lan = viewModel.location?.latitude ?? 0.0
        self.lon = viewModel.location?.longitude ?? 0.0
        decoding()
        
    }
    
    func decoding(){
        let endpoint = URL(string: "api.openweathermap.org/data/2.5/forecast?id=524901&appid=\(apikey)&lon=\(lon)&lan=\(lan)&today=\(today)")
        guard let url = endpoint else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            guard let data = data else{
                print("Problem with datas")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode([Weather].self, from: data)
                DispatchQueue.main.async {
                    self.weatherAll = data
                    print(self.weatherAll)
                    print("ez")
                    
                }
                
            } catch {
                print("DEBUG: Decoding error \(error.localizedDescription)")
            }
        }.resume()
    }
    
   
}




    
   
    




