//
//  ViewController.swift
//  MVVM
//
//  Created by Evgenii Rtishchev on 16/04/16.
//  Copyright © 2016 Evgenii Rtishchev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    weak var viewModel: StartViewModel! {
        didSet {
            viewModel.updateWeather {
                self.tableView.reloadData()
                self.activityView.stopAnimating()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    let cellIdentifier = String(CityCell)
    let segueIdenitifer = "ShowDetails"

    // MARK: - view cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let id = segue.identifier where id == segueIdenitifer,
           let detailsController = segue.destinationViewController as? DetailsViewController,
            index = sender as? Int {
            detailsController.viewModel = self.viewModel.detailsViewModel(index)
        }
    }
    
    // MARK: - table view
    
    private func setupTableView() {
        self.tableView.registerNib(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? CityCell
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiateWithOwner(nil, options: nil).first as? CityCell
        }
        cell!.viewModel = self.viewModel.cellViewModel(indexPath.row)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(segueIdenitifer, sender: indexPath.row)
    }
}

