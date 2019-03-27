//
//  ToVisitTableViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/23/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

class ToVisitTableViewController: UITableViewController {

	var stateController = StateController.shared
	var landmarks: [Landmark] {
		return stateController.userLandmarks
	}
	//var landmarks = [Landmark]()
    override func viewDidLoad() {
        super.viewDidLoad()

//		tableView.rowHeight = UITableView.automaticDimension
//		tableView.estimatedRowHeight = 152
		
		//landmarks = LibraryAPI.shared.getSavedLandmarks()
		//tableView.dataSource = self
		tableView.delegate = self
		
	
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
        return landmarks.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toVisitCell", for: indexPath) as! LandmarkListTableViewCell
		let validIndex = landmarks[indexPath.row].title
		if validIndex != nil {
			
			cell.locationLabel.adjustsFontSizeToFitWidth = true
			cell.locationDistanceLabel.adjustsFontSizeToFitWidth = true
			cell.locationLabel.text = landmarks[indexPath.row].title
			cell.locationDistanceLabel.text = landmarks[indexPath.row].name
			ImageService.getImage(withURL: landmarks[indexPath.row].imageUrl) { image in
				cell.backgroundView = UIImageView(image: image)
			}
		}

		return cell
    }
	


}
