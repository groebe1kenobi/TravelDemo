//
//  ToVisitViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class ToVisitViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	private var dataSource: LandmarkDataSource?
	let stateController = StateController.shared
	
	var toVisitLandmarks: [Landmark] {
		return stateController.getSavedLandmarks()
	}
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.estimatedRowHeight = UITableView.automaticDimension
		tableView.rowHeight = UITableView.automaticDimension
		self.dataSource = LandmarkDataSource(tableView: tableView, landmarks: toVisitLandmarks)
		tableView.dataSource = dataSource
		tableView.reloadData()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	
    

	

}
