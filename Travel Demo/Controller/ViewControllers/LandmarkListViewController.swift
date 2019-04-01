//
//  LandmarkListViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/28/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class LandmarkListViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	private var dataSource: LandmarkDataSource?
	var landmarks2: [Landmark]?
	
	var stateController = StateController.shared

	    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.estimatedRowHeight = 152
		tableView.rowHeight = UITableView.automaticDimension
		if let landmarks = landmarks2  {
			self.dataSource = LandmarkDataSource(tableView: tableView, landmarks: landmarks)
		}
		
		tableView.dataSource = dataSource
		tableView.reloadData()
        
    }
    

	

}
