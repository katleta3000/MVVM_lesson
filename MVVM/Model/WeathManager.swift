//
//  WeathManager.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 19/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import Foundation

class WeathManager {
    
    func getWeather(completion:[Weather] -> Void) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            completion(self.mockResponse())
        }
    }
    
    // MARK: - private
    
    private func mockResponse() -> [Weather] {
        var array = [Weather]()
        array.append(mockWeatherObject(10.2, city: "Moscow", precipitation: .Sunny, windSpeed: 2.1, windDirection: .North))
        array.append(mockWeatherObject(8.2, city: "London", precipitation: .Cloudly, windSpeed: 0.1, windDirection: .South))
        array.append(mockWeatherObject(18.9, city: "Madrid", precipitation: .Sunny, windSpeed: 0, windDirection: .North))
        array.append(mockWeatherObject(7.1, city: "Dublin", precipitation: .Rainy, windSpeed: 4.7, windDirection: .East))
        array.append(mockWeatherObject(22.5, city: "Tivat", precipitation: .Sunny, windSpeed: 1.5, windDirection: .South))
        return array
    }
    
    private func mockWeatherObject(temperature: Float, city: String,
        precipitation: Precipitation, windSpeed: Float, windDirection: WindDirection) -> Weather {
        var weather = Weather()
        weather.temperature = temperature
        weather.city = city
        weather.timestamp = NSDate().timeIntervalSince1970
        weather.precipitation = precipitation
        weather.windSpeed = windSpeed
        weather.windDirection = windDirection
        return weather
    }
}
