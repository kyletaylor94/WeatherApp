//
//  Weather.swift
//  WeatherApp
//
//  Created by Turdesán Csaba on 2023. 05. 18..
//


import Foundation


struct Weather: Codable{
    let list: [List]
    let City: [City]
}

struct City: Codable{
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

struct Coord: Codable{
    let lat, lon: Double
}

struct List: Codable{
    let dt: Int
    let main: MainClass
    let weather: [WeatherElement]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let sys: Sys
    let dtTxt: String
}

struct Clouds: Codable{
    let all: Int
}

struct MainClass: Codable{
    let temp, feelslike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
}

struct Rain: Codable{
    let the3H: Double
}

struct Sys: Codable{
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

struct WeatherElement: Codable{
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: String
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}







