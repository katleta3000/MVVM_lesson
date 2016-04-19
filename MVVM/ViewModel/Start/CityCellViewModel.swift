//
//  CityCellViewModel.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 18/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

// NO UIKit, no concern about view!

import Foundation

class CityCellViewModel {
    var cityTitle: String!
    var temperatureString: String!
    var timeString: String!
    
    required init(weather: Weather) {
        self.cityTitle = weather.city
        self.temperatureString = String(format: "%0.f%@", weather.temperature, "\u{00B0}")
        
        let df = NSDateFormatter()
        let date = NSDate(timeIntervalSince1970: weather.timestamp)
        df.dateFormat = "HH:mm"
        self.timeString = df.stringFromDate(date)
    }
}
