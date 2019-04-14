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
	
	let cellSpacingHeight: CGFloat = 5
	var stateController = StateController.shared
	var landmarks: [Landmark] {
		return StateController.shared.allLandmarks 
	}
	
	private let segueID = "menuToType"
	
	let sharedLandmarks = LibraryAPI.shared.getLandmark()
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView?.isHidden = true 
    }

	override func viewWillAppear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: animated)
		if let index = self.tableView.indexPathForSelectedRow {
			self.tableView.deselectRow(at: index, animated: true)
		}
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
		
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return cellSpacingHeight
	}
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = UIColor.clear
		return headerView
	}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell", for: indexPath) as! DiscoverMenuTableViewCell
		cell.locationTypeLabel.adjustsFontSizeToFitWidth = true
		
//		cell.layer.borderWidth = 8.0
//		cell.layer.borderColor = my.orange.cgColor
		
		switch indexPath.row {
		case 0:
			cell.locationTypeLabel.text = "Food"
			cell.locationTypeLabel.textColor = my.lightOrange
			let image = UIImage(named: "pizza")
			cell.locationTypeIV.image = image?.tint(with: my.lightOrange)
			
		case 1:
			cell.locationTypeLabel.text = "Drinks"
			cell.locationTypeLabel.textColor = my.orange
			let image = UIImage(named: "beer")
			cell.locationTypeIV.image = image?.tint(with: my.orange)
			
		case 2:
			cell.locationTypeLabel.text = "Nature"
			cell.locationTypeLabel.textColor = my.lightGreen
			let image = UIImage(named: "leaf")
			cell.locationTypeIV.image = image?.tint(with: my.lightGreen)
			
		case 3:
			cell.locationTypeLabel.text = "Entertainment"
			cell.locationTypeLabel.textColor = my.pink
			let image = UIImage(named: "ferrisWheel")
			cell.locationTypeIV.image = image?.tint(with: my.pink)
		case 4:
			cell.locationTypeLabel.text = "Museums"
			cell.locationTypeLabel.textColor = my.purple
			let image = UIImage(named: "building")
			cell.locationTypeIV.image = image?.tint(with: my.purple)
		case 5:
			cell.locationTypeLabel.text = "Free!"
			cell.locationTypeLabel.textColor = my.green
			let image = UIImage(named: "free")
			cell.locationTypeIV.image = image?.tint(with: my.green)
		case 6:
			cell.locationTypeLabel.text = "ALL"
			cell.locationTypeLabel.textColor = my.blue
			let image = UIImage(named: "skiMask")
			cell.locationTypeIV.image = image?.tint(with: .black)
		default:
			print("Should not get here")
			
		}

		
		//cell.layer.borderColor = my.blue.cgColor
        return cell
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == segueID {
			let destinationVC = segue.destination as! LandmarkListViewController
			let selectedIndex = self.tableView.indexPathForSelectedRow!
			let row = selectedIndex.row
			switch row {
			case 0:
				destinationVC.landmarks2 = StateController.shared.filter("Restaurant")
			case 1:
				destinationVC.landmarks2 = StateController.shared.filter("Drink")
			case 2:
				destinationVC.landmarks2 = StateController.shared.filter("Nature")
			case 3:
				destinationVC.landmarks2 = StateController.shared.filter("Entertainment")
			case 4:
				destinationVC.landmarks2 = StateController.shared.filter("Museum")
			case 5:
				destinationVC.landmarks2 = StateController.shared.filter("Nature")
			case 6:
				destinationVC.landmarks2 = []
			default:
				destinationVC.landmarks2 = StateController.shared.allLandmarks
			}
			
		}
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		switch indexPath.row {
		case 0:
			performSegue(withIdentifier: segueID, sender: indexPath.row)

		case 1:
			performSegue(withIdentifier: segueID, sender: indexPath.row)

		case 2:
			performSegue(withIdentifier: segueID, sender: indexPath.row)

		case 3:
			performSegue(withIdentifier: segueID, sender: indexPath.row)
			
		case 4:
			performSegue(withIdentifier: segueID, sender: indexPath.row)
			
		default:
			print("ERROR SELECTING LANDMARK TYPES")
		}
			}

}
