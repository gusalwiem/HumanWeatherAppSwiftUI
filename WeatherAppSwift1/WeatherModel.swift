//
//  WeatherData.swift
//  WeatherAppSwift1
//
//  Created by Emy Alwin on 2024-02-19.
//

import SwiftUI

struct WeatherModel{
    var city: String
    var description: String
    var icon: String
    var temp: Double
    var min: Double
    var max: Double
   
    var image: String {
        switch icon{
        case "01d": return "sun.max.fill"
        case "01n": return "moon.zzz.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03d": return "cloud.fill"
        case "03n": return "cloud.fill"
        case "04d": return "smoke.fill"
        case "04n": return "smoke.fill"
        case "09d": return "cloud.rain.fill"
        case "09n": return "cloud.rain.fill"
        case "10d": return "cloud.sun.rain.fill"
        case "10n": return "cloud.moon.rain.fill"
        case "11d": return "cloud.bolt.fill"
        case "11n": return "cloud.bolt.fill"
        case "13d": return "cloud.snow.fill"
        case "13n": return "cloud.snow.fill"
        case "50d": return "wind"
        case "50n": return "wind"
        default: return "sparkles"
        }
    }
    
    var iconColor: Color {
        switch icon{
        case "01d": return .yellow
        case "01n": return .gray
        default: return .white
        }
    }
}

struct WeatherData: Decodable {
    var name: String
    let weather: [WeatherResponse]
    let main: MainResponse
}

struct WeatherResponse: Decodable{
    let description: String
    let icon: String
}

struct MainResponse: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}



