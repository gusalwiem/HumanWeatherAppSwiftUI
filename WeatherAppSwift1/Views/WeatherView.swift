//
//  ContentView.swift
//  WeatherAppSwift1
//
//  Created by Emy Alwin on 2024-02-19.
//

import SwiftUI

struct WeatherView: View {
    @State var lat: String
    @State var lon: String
    @ObservedObject private var apiWeather = APIWeather()
    @State private var weather: WeatherModel?
        
    var body: some View {
            ZStack{
                ContainerRelativeShape().fill(Color(red: 157/255, green: 206/255, blue: 241/255)).ignoresSafeArea() //background color
             
             VStack{
                 Text(weather?.city ?? "City Loading...")
                     .font(.system(size: 32, weight: .medium, design: .default))
                     .foregroundColor(.black)
                     .padding()
                 MainWeather(imageName: weather?.image ?? "sparkles", temp: weather?.temp ?? 0, iconColor: weather?.iconColor ?? .yellow)
                 WeatherInfo(description: weather?.description ?? "Loading...", minTemp: weather?.min ?? 0, maxTemp: weather?.max ?? 0)
                 
             }
            }
            .task {
                do {
                    try await weather = apiWeather.getWeather(lat: lat, lon: lon)
                } catch {
                    print(error)
                }
        }
    }
}


struct MainWeather: View {
    var imageName: String
    var temp: Double
    var iconColor: Color
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .symbolRenderingMode(.monochrome)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
                .foregroundColor(iconColor)

            Text("\(temp.formatted(.number.precision(.fractionLength(0))))°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct WeatherInfo: View{
    var description: String
    var minTemp: Double
    var maxTemp: Double
    
    var body: some View {
        VStack {
            InfoText(text: description.capitalized).padding()
            HStack(spacing: 20){
                VStack{
                    InfoText(text: "Min", textColor: .blue)
                    InfoText(text: "\(minTemp.formatted(.number.precision(.fractionLength(0)))) °C")
                }
                VStack{
                    InfoText(text: "Max", textColor: .blue)
                    InfoText(text: "\(maxTemp.formatted(.number.precision(.fractionLength(0)))) °C")
                }
            }
        }
    }
}

struct InfoText: View {
    var text: String
    var textColor: Color = .black
    
    var body: some View {
        Text(text).font(.system(size: 20, weight: .medium, design: .default))
            .foregroundColor(textColor)
    }
}
