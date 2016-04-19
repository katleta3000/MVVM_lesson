//
//  DetailsViewController.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 19/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    weak var viewModel: DetailsViewModel!
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherLabel.text = viewModel.temperatureString
        self.windLabel.text = viewModel.windString
        self.cityLabel.text = viewModel.cityTitle
        self.precipitationLabel.text = viewModel.precipitationString
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - actions
    
    @IBAction func clickedBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
