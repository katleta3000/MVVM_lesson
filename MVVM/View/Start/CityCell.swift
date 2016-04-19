//
//  CityCell.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 18/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    weak var viewModel: CityCellViewModel! {
        didSet {
            self.timeLabel.text = viewModel.timeString
            self.cityLabel.text = viewModel.cityTitle
            self.temperatureLabel.text = viewModel.temperatureString
        }
    }
}
