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
	var selectedLandmark: Landmark?
	//var stateController = StateController.shared

	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.estimatedRowHeight = 152
		tableView.rowHeight = UITableView.automaticDimension
		tableView.tableFooterView?.isHidden = true
		if let landmarks = landmarks2  {
			self.dataSource = LandmarkDataSource(tableView: tableView, landmarks: landmarks)
		}
		
		tableView.dataSource = dataSource
		tableView.delegate = self 
		tableView.reloadData()
        
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		if let index = self.tableView.indexPathForSelectedRow {
			self.tableView.deselectRow(at: index, animated: true)
		}
		
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "listToLandmark" {
			if let destination = segue.destination as? LandmarkViewController {
				destination.landmark = selectedLandmark
			}
		}
	}
    

	

}

extension LandmarkListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let landmark = landmarks2?[indexPath.row] {
			selectedLandmark = landmark
			self.performSegue(withIdentifier: "listToLandmark", sender: self)
		}
		
	}
}
