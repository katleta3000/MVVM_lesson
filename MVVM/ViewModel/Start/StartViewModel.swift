//
//  StartViewModel.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 16/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

// NO UIKit, no concern about view!

class StartViewModel {
    weak var weatherManager: WeathManager!
    private var cellsArray = [CityCellViewModel]()
    private var weatherArray: [Weather]!
    var detailsViewModel: DetailsViewModel!
    
    func updateWeather(completion:() -> Void) {
        cellsArray.removeAll()
        weatherManager.getWeather { (weatherArray) -> Void in
            self.weatherArray = weatherArray
            for weatherObject in weatherArray {
                self.cellsArray.append(CityCellViewModel(weather: weatherObject))
            }
            completion()
        }
    }

    func numberOfCities() -> Int {
        return cellsArray.count
    }
    
    func cellViewModel(index: Int) -> CityCellViewModel? {
        guard index < cellsArray.count else { return nil }
        return cellsArray[index]
    }
    
    func detailsViewModel(index: Int) -> DetailsViewModel {
        self.detailsViewModel = DetailsViewModel(weather: weatherArray[index])
        return self.detailsViewModel
    }
    
    required init(weatherManager: WeathManager) {
        self.weatherManager = weatherManager
    }
}
