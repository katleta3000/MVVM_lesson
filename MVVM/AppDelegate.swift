//
//  AppDelegate.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 16/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let weatherManager = WeathManager()
    var startViewModel: StartViewModel!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.startViewModel = StartViewModel(weatherManager: weatherManager)
        if let startController = self.window?.rootViewController as? StartViewController {
            startController.viewModel = startViewModel
        }
        return true
    }
}

