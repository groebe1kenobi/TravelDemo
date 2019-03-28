//
//  LandmarkListTableViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit
import CoreLocation

class LandmarkListTableViewController: UITableViewController {

	//var filteredLandmarks: [Landmark] = [Landmark]()
	var filterType: String?
	var stateController = StateController.shared
	var landmarks: [Landmark] {
		switch filterType {
		case let filterType where filterType == "Restaurant":
			return stateController.filter(filterType!)
			
		case let filterType where filterType == "Drink":
			return stateController.filter(filterType!)
			
		case let filterType where filterType == "Nature":
			return stateController.filter(filterType!)
			
		case let filterType where filterType == "Entertainment":
			return stateController.filter(filterType!)
			
		case let filterType where filterType == "Museum":
			return stateController.filter(filterType!) 
			
		default:
			return []
		}
	}
	let userLocation = CLLocation(latitude: 41.787663516, longitude: -87.576331028 )
	let distanceOperator = DistanceOperators()
	var selectedLandmark: Landmark?
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 152
		tableView.reloadData()
		
		for landmark in landmarks {
			print("LandmarkListTableViewMember: \(String(describing: landmark.title))")
		}
   
    }
	
	

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
		tableView.reloadData()
//		for landmark in filteredLandmarks {
//			print(landmark.title!)
//		}
		
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return filteredLandmarks.count
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "listToLandmark" {
			let destination = segue.destination as! LandmarkViewController
			destination.landmark = self.selectedLandmark
		}
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if (landmarks.indices.contains(indexPath.row)) {
			selectedLandmark = landmarks[indexPath.row]
			self.performSegue(withIdentifier: "listToLandmark", sender: self)
		}
	}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "landmarkCell", for: indexPath) as! LandmarkListTableViewCell
			
		
		let validIndex = filteredLandmarks[indexPath.row].title
		
		if(validIndex != nil) {
			
			cell.locationLabel.adjustsFontSizeToFitWidth = true
			cell.locationDistanceLabel.adjustsFontSizeToFitWidth = true
			cell.locationLabel.text = filteredLandmarks[indexPath.row].title
			cell.locationDistanceLabel.text = "\(distanceOperator.getDistance(filteredLandmarks[indexPath.row].coordinate, userLocation))"
			ImageService.getImage(withURL: filteredLandmarks[indexPath.row].imageUrl) { image in
				//cell.locationImageView.image = image
				cell.backgroundView = UIImageView(image: image)
			}
		}
		
        

        return cell
    }
	

    

}

