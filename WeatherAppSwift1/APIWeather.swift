//
//  APIWeather.swift
//  WeatherAppSwift1
//
//  Created by Emy Alwin on 2024-02-19.
//

import Foundation

class APIWeather: ObservableObject {
    private var apiKey: String = "53b6222b974d4277240d894c4b77f998"
   
    func getWeather(lat: String, lon: String) async throws -> WeatherModel?{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid="+apiKey+"&units=metric") else { fatalError("Missing URL")}
            
        let urlRequest = URLRequest(url: url)
            do{
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    return nil
                }

                let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)

                let weatherModel = WeatherModel(city: decodedData.name,
                                                description: decodedData.weather[0].description,
                                                icon: decodedData.weather[0].icon,
                                                temp: decodedData.main.temp,
                                                min: decodedData.main.temp_min,
                                                max: decodedData.main.temp_max)

                return weatherModel
            }
            catch{
                print("Error fetching data")
            }
        
        return nil
        }
}
