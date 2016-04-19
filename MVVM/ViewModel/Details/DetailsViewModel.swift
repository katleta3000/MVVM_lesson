//
//  DetailsViewModel.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 19/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import Foundation

class DetailsViewModel {
    var cityTitle: String!
    var windString: String!
    var precipitationString: String!
    var temperatureString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temperature, "\u{00B0}")
        
        let windStr: String
        switch weather.windDirection! {
        case .North: windStr = "Noth"; break
        case .South: windStr = "South"; break
        case .West: windStr = "West"; break
        case .East: windStr = "East"; break
        }
        self.windString = String(format: "%@ wind, %0.f m/s", windStr, weather.windSpeed)
        
        let preciptionStr: String
        switch weather.precipitation! {
        case .Sunny: preciptionStr = "Sunny"; break
        case .Cloudly: preciptionStr = "Cloudly"; break
        case .Rainy: preciptionStr = "Rainly"; break
        case .Stormly: preciptionStr = "Stormly"; break
        case .Thunderly: preciptionStr = "Thunderly"; break
        }
        self.precipitationString = preciptionStr
    }
}
