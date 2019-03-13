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
	let userLocation = CLLocation(latitude: 41.787663516, longitude: -87.576331028 )
	let distanceOperator = DistanceOperators()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
   
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		for landmark in filteredLandmarks {
			print(landmark.title!)
		}
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return filteredLandmarks.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "landmarkCell", for: indexPath) as! LandmarkListTableViewCell
			
		
		let validIndex = filteredLandmarks[indexPath.row].title
		//let landmarkView = AlbumView(frame: CGRect(x: 0, y: 0, width: 375, height: 151), coverUrl: filteredLandmarks[indexPath.row].imageUrl)
		if(validIndex != nil) {
			cell.locationLabel.adjustsFontSizeToFitWidth = true
			cell.locationDistanceLabel.adjustsFontSizeToFitWidth = true
			cell.locationLabel.text = filteredLandmarks[indexPath.row].title
			cell.locationDistanceLabel.text = "\(distanceOperator.getDistance(filteredLandmarks[indexPath.row].coordinate, userLocation))"
			ImageService.downloadImage(withURL: filteredLandmarks[indexPath.row].imageUrl) { image in
				//image?.size.width = 
				cell.locationImageView.image = image
				
			}
			
			
			//cell.landmarkView = landmarkView
			//cell.locationImageView.image = LibraryAPI.shared.downloadImage(with: filteredLandmarks[indexPath.row].imageUrl)
		}
		
        

        return cell
    }
	

    

}

