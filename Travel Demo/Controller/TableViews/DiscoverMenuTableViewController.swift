//
//  DiscoverMenuTableViewController.swift
//  Travel Demo
//
//  Created by Sean Groebe on 3/6/19.
//  Copyright © 2019 Groebe. All rights reserved.
//

import UIKit

var filteredLandmarks = [Landmark]()

class DiscoverMenuTableViewController: UITableViewController {
	
	var selectedLandmarks = [Landmark]()
	
	private let segueID = "menuToType"
	let sharedLandmarks = LibraryAPI.shared.getLandmark()
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath) as! DiscoverMenuTableViewCell
		cell.locationTypeLabel.adjustsFontSizeToFitWidth = true
		
		switch indexPath.row {
		case 0:
			cell.locationTypeLabel.text = "Food"
			cell.locationTypeLabel.textColor = UIColor.init(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
			cell.locationTypeIV.image = UIImage(named: "restaurant")
			
		case 1:
			cell.locationTypeLabel.text = "Drinks"
			cell.locationTypeLabel.textColor = UIColor.init(red: 245/255, green: 0/255, blue: 87/255, alpha: 1.0)
			cell.locationTypeIV.image = UIImage(named: "cocktail")
			
		case 2:
			cell.locationTypeLabel.text = "Nature"
			cell.locationTypeLabel.textColor = UIColor.init(red: 104/255, green: 159/255, blue: 56/255, alpha: 1.0)
			cell.locationTypeIV.image = UIImage(named: "nature")
			
		case 3:
			cell.locationTypeLabel.text = "Entertainment"
			cell.locationTypeLabel.textColor = UIColor.init(red: 1.0, green: 61/255, blue: 0/255, alpha: 1.0)
			cell.locationTypeIV.image = UIImage(named: "circus")
		default:
			print("Should not get here")
			
		}

        // Configure the cell...

        return cell
    }
	
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == segueID,
//			//let indexPath = tableView.indexPathForSelectedRow
//			//let index = indexPath?.row
//			let landmarkVC = segue.destination as? LandmarkListTableViewController, let index = tableView.indexPathForSelectedRow?.row {
//			switch index {
//			case 0:
//				print("PREPARE FOR SEGUE ENGAGED")
//				landmarkVC.filteredLandmarks = sharedLandmarks.filter({$0.type == "Restaurant"}).map({return $0})
//			case 1:
//				landmarkVC.filteredLandmarks = sharedLandmarks.filter({$0.type == "Drinks"}).map({return $0})
//			case 2:
//				landmarkVC.filteredLandmarks = sharedLandmarks.filter({$0.type == "Nature"}).map({return $0})
//			case 4:
//				landmarkVC.filteredLandmarks = sharedLandmarks.filter({$0.type == "Entertainment"}).map({return $0})
//			default:
//				print("ERROR SELECTING LANDMARK TYPES")
//			}
//		}
//	}
//
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		let cell = tableView.cellForRow(at: indexPath)
//
//		if cell != nil {
//			self.performSegue(withIdentifier: segueID, sender: nil)
//		}
//		tableView.deselectRow(at: indexPath, animated: true)
//		let row = indexPath.row
//		print(sharedLandmarks[row])
//		self.performSegue(withIdentifier: segueID, sender: nil)
		switch indexPath.row {
		case 0:
			print("PREPARE FOR SEGUE ENGAGED")
			filteredLandmarks = sharedLandmarks.filter({$0.type == "Restaurant"}).map({return $0})
			performSegue(withIdentifier: segueID, sender: self)

		case 1:
			filteredLandmarks = sharedLandmarks.filter({$0.type == "Drinks"}).map({return $0})
			performSegue(withIdentifier: segueID, sender: self)

		case 2:
			filteredLandmarks = sharedLandmarks.filter({$0.type == "Nature"}).map({return $0})
			performSegue(withIdentifier: segueID, sender: self)

		case 4:
			filteredLandmarks = sharedLandmarks.filter({$0.type == "Entertainment"}).map({return $0})
			performSegue(withIdentifier: segueID, sender: self)

		default:
			print("ERROR SELECTING LANDMARK TYPES")
		}
			}

}
