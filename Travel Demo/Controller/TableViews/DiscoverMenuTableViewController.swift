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
	
	
	var stateController = StateController.shared
	var landmarks: [Landmark] {
		return stateController.allLandmarks 
	}
	
	private let segueID = "menuToType"
	
	let sharedLandmarks = LibraryAPI.shared.getLandmark()
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
    }

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
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
		case 4:
			cell.locationTypeLabel.text = "Museums"
			cell.locationTypeLabel.textColor = UIColor.init(red: 232/255, green: 148/255, blue: 25/255, alpha: 1.0)
			cell.locationTypeIV.image = UIImage(named: "museum")
		default:
			print("Should not get here")
			
		}

		

        return cell
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if(segue.identifier == segueID) {
			let destination = segue.destination as! LandmarkListTableViewController
			if let indexPath = tableView.indexPathForSelectedRow {
				switch indexPath.row {
				case 0:
					destination.filterType = "Restaurant"
				case 1:
					destination.filterType = "Drink"
				case 2:
					destination.filterType = "Nature"
				case 3:
					destination.filterType = "Entertainment"
				case 4:
					destination.filterType = "Museum"
				default:
					destination.filterType = ""
					print("No landmarks so show... shouldn't get here")
				}
			}
		}
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		switch indexPath.row {
		case 0:
			performSegue(withIdentifier: segueID, sender: self)

		case 1:
			performSegue(withIdentifier: segueID, sender: self)

		case 2:
			performSegue(withIdentifier: segueID, sender: self)

		case 3:
			performSegue(withIdentifier: segueID, sender: self)
			
		case 4:
			performSegue(withIdentifier: segueID, sender: self)
			
		default:
			print("ERROR SELECTING LANDMARK TYPES")
		}
			}

}
