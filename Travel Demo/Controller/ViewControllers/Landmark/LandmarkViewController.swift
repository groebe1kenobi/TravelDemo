//
//  LandmarkViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/14/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CoreData
import CDYelpFusionKit

class LandmarkViewController: UIViewController {

	@IBOutlet weak var landmarkImageView: UIImageView!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var tableView: UITableView!
	
	var stateController = StateController.shared
	
	var userLandmarks: [Landmark] {
		return stateController.userLandmarks 
	}
	
	var landmark: Landmark?
	private var dataSource: ReviewSiteDataSource?
	var yelpObject: [CDYelpBusiness]?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 90
		self.dataSource = ReviewSiteDataSource(tableView: tableView)
		tableView.dataSource = dataSource
		tableView.reloadData()
		
    }
    
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
	
		ImageService.getImage(withURL: (landmark?.imageUrl)!) { image in
			self.landmarkImageView.image = image
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		
	}
	
	@IBAction func addLandmarkButton(_ sender: Any) {
		
		
		let alert = UIAlertController(title: "New Landmark", message: "Add Landmark to your list", preferredStyle: .alert)
		
		let addAction = UIAlertAction(title: "Add", style: .default) {
			[unowned self] action in
			guard let landmarkToAdd = self.landmark else {
				return
			}
			
			if StateController.shared.landmarkIsSaved(landmarkToAdd) {
				print("Not adding!")
				return
			} else {
				print("Successfully added Landmark: \(landmarkToAdd.title!)")
				//self.stateController.addLandmarkToSave(landmarkToAdd)
				StateController.shared.addLandmarkToSave(landmarkToAdd)
				//self.stateController.updateLandmarks()
				//self.stateController.saveMyLandmarks()
			}
			
		}
		
		
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		
		alert.addAction(addAction)
		alert.addAction(cancelAction)
		present(alert, animated: true)
		
		
		
	
	}
	
	
	
}


extension StateController {
	func landmarkIsSaved(_ landmark: Landmark) -> Bool {
		if userLandmarks.contains(landmark) {
			return true
		}
		
		return false
	}
}
