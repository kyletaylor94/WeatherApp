//
//  UserLocation.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//

import Foundation
import CoreLocation

class UserLocation: NSObject,CLLocationManagerDelegate,ObservableObject{
    
    private let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        if let longitude = location?.longitude{
            if let latitude = location?.latitude{
                print(longitude)
                print(latitude)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
