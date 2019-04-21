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
	var stateController = StateController.shared
	
	var toVisitLandmarks: [Landmark] {
		return StateController.shared.getSavedLandmarks()
	}
	
	lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		
		refreshControl.addTarget(self, action: #selector(ToVisitViewController.handleRefresh(_:)), for: UIControl.Event.valueChanged)
		refreshControl.tintColor = my.pink
		
		return refreshControl
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.estimatedRowHeight = UITableView.automaticDimension
		tableView.rowHeight = 150
		tableView.addSubview(refreshControl)
		getLandmarks(StateController.shared) { landmarks in
			self.dataSource = LandmarkDataSource(tableView: tableView, landmarks: landmarks)
			
		}
		tableView.dataSource = dataSource
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
			self.tableView.reloadData()
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				self.tableView.reloadData()
				
			}
		}
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		getLandmarks(StateController.shared) { landmarks in
			self.dataSource = LandmarkDataSource(tableView: tableView, landmarks: landmarks)
			
		}
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
			self.tableView.reloadData()
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				self.tableView.reloadData()
				
			}
		}
	}
	
	func getLandmarks(_ stateController: StateController, completion: (_ landmark: [Landmark]) -> Void) {
		let myLandmarks = stateController.getSavedLandmarks()
		completion(myLandmarks)
	}
    

	

}

extension ToVisitViewController {
	
	
	@objc func handleRefresh(_ refreshControl: UIRefreshControl) {

		
		self.tableView.reloadData()
		
		refreshControl.endRefreshing()
			
	}
}

